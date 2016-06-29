//
//  ProfileViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import SwiftyJSON
import SCLAlertView


class ProfileDetailViewController: BaseViewController, SlideMenuControllerDelegate {
    
    @IBOutlet weak var kegemaranView: UIImageView!
    @IBOutlet weak var fotoView: UIImageView!
    @IBOutlet weak var sembangView: UIImageView!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var sexLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var userNameAge: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    var userId : String = ""
    var imgName = UIImage()
    var userName = String()
    var tempData = NSDictionary()
    //var userArray :[JSON] = [JSON]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer1 = UITapGestureRecognizer(target:self, action:#selector(ProfileDetailViewController.imageTapped1(_:)))
        kegemaranView.userInteractionEnabled = true
        kegemaranView.addGestureRecognizer(tapGestureRecognizer1)
        let tapGestureRecognizer2 = UITapGestureRecognizer(target:self, action:#selector(ProfileDetailViewController.imageTapped2(_:)))
        fotoView.userInteractionEnabled = true
        fotoView.addGestureRecognizer(tapGestureRecognizer2)
        let tapGestureRecognizer3 = UITapGestureRecognizer(target:self, action:#selector(ProfileDetailViewController.imageTapped3(_:)))
        sembangView.userInteractionEnabled = true
        sembangView.addGestureRecognizer(tapGestureRecognizer3)
        setupLeftButton()
        //profileImageView.image = imgName
        //user.text = userName
        self.title = ""
        print("user ID is \(userId)")
        userNameAge.text = userName
        profileImageView.createBorder()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ProfileDetailViewController.refreshDetail(_:)), name: "reloadDetail", object: nil)
        let id = "\(userId)"
        showLoading()
        JodohAppProvider.request(.GetDetail(id), completion: { (result) in
            switch result {
            case .Success(let successResult):
                do {
                    let json = try JSON(NSJSONSerialization.JSONObjectWithData(successResult.data, options: .MutableContainers))
                    
                    if  json["status"].string == "success"{
                        let data = NSKeyedArchiver.archivedDataWithRootObject(json["user_profile"].dictionaryObject!)
                        defaults.setObject(data, forKey: "userProfile")//simpan data
                        defaults.setValue(json["auth_token"].string , forKey: "auth_token")//simpan data
                        defaults.synchronize()
                        NSNotificationCenter.defaultCenter().postNotificationName("reloadDetail", object: nil)
                        
                    }else if (json["error"].string != nil){
                        //showErrorMessage(json["error"].string!)
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
    }
    
    func refreshDetail(notif:NSNotificationCenter){
        
        let userInfo = defaults.objectForKey("userProfile") as! NSData
        tempData = NSKeyedUnarchiver.unarchiveObjectWithData(userInfo) as! NSDictionary
        print(tempData)
        let id = tempData["user_id"]! as? String
        let dob = tempData["user_dob"]! as? String
        let height = tempData["user_height"]! as? String
        let weight = tempData["user_weight"]! as? String
        if height != nil{
            ageLbl.text = tempData["user_dob"]! as? String
            sexLbl.text = tempData["user_sex"]! as? String
            statusLbl.text = tempData["user_marital"]! as? String
            heightLbl.text = (height)!+" cm"
            weightLbl.text = (weight)!+" kg"
            userNameAge.text = (id)!+", "+(dob)!
        }else{
            heightLbl.text = "-"
            weightLbl.text = "-"
            userNameAge.text = tempData["user_id"]! as? String
            ageLbl.text = "-"
            sexLbl.text = "-"
            statusLbl.text = "-"
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped1(img: AnyObject)
    {
        let storyboard = UIStoryboard(name: "Favourite", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("FavouriteVC") as! FavouriteViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
    
    func imageTapped2(img: AnyObject)
    {
        let storyboard = UIStoryboard(name: "PhotoGallery", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("PhotoGalleryVC") as! PhotoGalleryViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
    
    func imageTapped3(img: AnyObject)
    {
        let storyboard = UIStoryboard(name: "Package", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("PackageVC") as! PackageViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
        SCLAlertView().showInfo("Info", subTitle: "Anda perlu menjadi ahli premium", closeButtonTitle: "OK", colorStyle: 0x0679AD)
    }


}
