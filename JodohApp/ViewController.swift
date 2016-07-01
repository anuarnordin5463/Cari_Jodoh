//
//  ViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SwiftyJSON
import SlideMenuControllerSwift
import Kingfisher

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, SlideMenuControllerDelegate {
    @IBOutlet weak var onoffImage: UIImageView!
    @IBOutlet weak var onoffLbl: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    var valueToPass:String!
    var userArray :[JSON] = [JSON]()
    var tempData = NSDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.refreshDetail(_:)), name: "reloadDetail", object: nil)
        let name = defaults.objectForKey("email") as! String
        let pass = defaults.objectForKey("password") as! String
        //hideLoading()
        JodohAppProvider.request(.List(name,pass), completion: { (result) in
            switch result {
            case .Success(let successResult):
                do {
                    let json = try JSON(NSJSONSerialization.JSONObjectWithData(successResult.data, options: .MutableContainers))
                    
                    if  json["status"].string == "success"{
                        
                        //showInfoLogin(json["message"].string!)
                        //defaults.setValue(json["auth_token"].string , forKey: "auth_token")//simpan data
                        //defaults.synchronize()
                        self.userArray = json["listUser"].array!
                        self.collectionView.reloadData()
                        print(json["listUser"].array!)
                        
                    }else if (json["error"].string != nil){
                        showErrorMessage(json["error"].string!)
                    }else {
                        showErrorMessage(json["message"].string!)
                    }
                    hideLoading()
                    print(json)
                }
                catch {
                    
                }
                
            case .Failure(let failureResult):
                //print(failureResult)
                hideLoading()
                showErrorMessage(failureResult.nsError.localizedDescription)
            }
        })
        //print(calcAge("1991-08-21 16:00:00 +0000"))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func refreshDetail(notif:NSNotificationCenter){
        
        let userInfo = defaults.objectForKey("userProfile") as! NSData
        tempData = NSKeyedUnarchiver.unarchiveObjectWithData(userInfo) as! NSDictionary
        //print(tempData)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.items.count
        return userArray.count
        
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MyCollectionViewCell
        
        let user_id = self.userArray[indexPath.item].dictionary!["user_id"]!.stringValue
        let birthday = self.userArray[indexPath.item].dictionary!["user_dob"]!.stringValue
        let status = self.userArray[indexPath.item].dictionary!["user_status"]!.stringValue
        let image = self.userArray[indexPath.item].dictionary!["user_image"]!.stringValue
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = "\(user_id)"
        //cell.statusLbl.text = "\(status)"
        if status == "online"{
            cell.onoffImage.image = UIImage(named:"online")
        }else{
            cell.onoffImage.image = UIImage(named:"offline")
        }
        if birthday != ""{
        cell.ageLbl.text = "\(NSDate.calculateYearFromToday(birthday)) Tahun"
        }else{
        cell.ageLbl.text = "-"
        }
        if image != ""{
            
            cell.picImageView.kf_setImageWithURL(NSURL(string: "http://carijodoh.me-tech.com.my/user_image/\(image)")!, placeholderImage: nil,
                                                  optionsInfo: [.Transition(ImageTransition.Fade(1))],
                                                  progressBlock: { receivedSize, totalSize in
                                                    print("\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
                },
                                                  completionHandler: { image, error, cacheType, imageURL in
                                                    print("\(indexPath.row + 1): Finished")
            })
               //print("http://carijodoh.me-tech.com.my/user_image/\(image)")
        } else {
            cell.picImageView.image = UIImage(named:"personIcon")
        }
        
        //print(image)
        //print(calcAge("\(birthday)"))
        //cell.picImageView.image = self.userArray[indexPath.item]
        cell.backgroundColor = UIColor(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1)
        cell.picImageView.createBorder()
        
        return cell
    }
    
    
     func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        // This will cancel all unfinished downloading task when the cell disappearing.
        // swiftlint:disable force_cast
        (cell as! MyCollectionViewCell).picImageView.kf_cancelDownloadTask()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toDetail"){
            
            let destVC =  segue.destinationViewController as! ProfileDetailViewController
            let selectedIndexPath = self.collectionView.indexPathsForSelectedItems()!.last
            destVC.userId = self.userArray[(selectedIndexPath?.item)!]["id"].stringValue
            destVC.userStatus = self.userArray[(selectedIndexPath?.item)!]["user_status"].stringValue
            let birthday = self.userArray[(selectedIndexPath?.item)!]["user_dob"].stringValue
            if birthday != ""{
            destVC.passedValue = "\(NSDate.calculateYearFromToday(birthday)) Tahun"
            }
            
        }
    }
}
