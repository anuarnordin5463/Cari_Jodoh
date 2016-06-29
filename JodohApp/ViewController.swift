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

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, SlideMenuControllerDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var userArray :[JSON] = [JSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        let name = defaults.objectForKey("email") as! String
        let pass = defaults.objectForKey("password") as! String
        showLoading()
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
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    // MARK: - UICollectionViewDataSource protocol
    //@IBOutlet weak var myLabel: MyCollectionViewCell!
    // tell the collection view how many cells to make
    
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
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = "\(user_id)"
        cell.statusLbl.text = "\(status)"
        if birthday != ""{
        cell.ageLbl.text = "\(birthday)"
        }else{
        cell.ageLbl.text = "-"
        }
        
        //cell.picImageView.image = self.userArray[indexPath.item]
        cell.backgroundColor = UIColor(red: 243/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1)
        
        cell.picImageView.createBorder()
        
        return cell
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toDetail"){
            let destVC =  segue.destinationViewController as! ProfileDetailViewController
            let selectedIndexPath = self.collectionView.indexPathsForSelectedItems()!.last
            destVC.userId = self.userArray[(selectedIndexPath?.item)!]["id"].stringValue
            
           // destVC.imgName = (pics[selectedIndexPath!.item])
            //destVC.userName = (items[selectedIndexPath!.item])
        }
    }
}
