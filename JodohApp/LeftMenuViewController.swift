//
//  LeftMenuViewController.swift
//  JodohApps
//
//  Created by Nazri Hussein on 4/25/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SCLAlertView
import SwiftyJSON

class LeftMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    var mainViewController: UIViewController!
    var menuSections:[String] = ["Laman Utama", "Kemaskini Profil", "Galeri Foto", "Kegemaran", "Sembang", "Carian", "Tetapan","Log Masuk","Daftar Baru","Tentang Kami","Log Keluar"]
    var menuIcon:[String] = ["lamanUtama", "kemaskiniProfil", "galeriPhoto", "kegemaran", "sembang", "carian", "tetapanCarian","Login","Register", "tentangKami", "logKeluar"]
   
    var hideRow : Bool = false
    
    var tmpData = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        let signature2 = defaults.objectForKey("signature") as! String
        if (signature2 == "") {
            userImage.image = UIImage(named:"personIcon")
        } else {
            hideRow = true
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                dispatch_async(dispatch_get_main_queue(), {
                    self.userImage.image = UIImage(data: data!)
                })
            }
        }

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LeftMenuViewController.refreshSideMenu(_:)), name: "reloadSideMenu", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LeftMenuViewController.refreshSideMenuLogOut(_:)), name: "reloadSideMenuLogOut", object: nil)
        //userId.text = self.items[indexPath.item]
        //userImage.image = self.pics[indexPath.item]
        //userImage.backgroundColor = UIColor.whiteColor() // make cell more visible in our example project
        //userImage.image = image
        //userImage.image = UIImage(named:"mawi")
        userId.text = signature2
        //userId.text = userName---
        //var x : [String : AnyObject?] = ["test" : nil]
        //x["test"] = nil
        //userImage.image = image
        //userImage.image = imgName---
        userImage.layer.borderWidth = 1
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.lightGrayColor().CGColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
        //print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshSideMenu(notif:NSNotificationCenter){
        userId.text = defaults.objectForKey("signature") as? String
        hideRow = true
        self.leftTableView.reloadData()
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                dispatch_async(dispatch_get_main_queue(), {
                    self.userImage.image = UIImage(data: data!)
                })
            }
        userImage.layer.borderWidth = 1
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.lightGrayColor().CGColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
    }
    
    func refreshSideMenuLogOut(notif:NSNotificationCenter){
        userId.text = defaults.objectForKey("signature") as? String
        hideRow = false
        self.leftTableView.reloadData()
        userImage.image = UIImage(named:"personIcon")
        userImage.layer.borderWidth = 1
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.lightGrayColor().CGColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if
            (indexPath.row == 1 && hideRow == false) ||
            (indexPath.row == 2 && hideRow == false) ||
            (indexPath.row == 3 && hideRow == false) ||
            (indexPath.row == 4 && hideRow == false) ||
            (indexPath.row == 5 && hideRow == false) ||
            (indexPath.row == 6 && hideRow == false) ||
            (indexPath.row == 10 && hideRow == false) ||
            (indexPath.row == 7 && hideRow == true) ||
            (indexPath.row == 8 && hideRow == true)
        {
            return 0.0
        }else {
            return 48
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuSections.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = leftTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SideMenuTableViewCell
        cell.menuLbl.text = menuSections[indexPath.row]
        cell.menuIcon.image = UIImage(named: menuIcon[indexPath.row])
        //self.leftTableView.reloadData()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signature2 = defaults.objectForKey("signature") as! String
        
        if indexPath.row == 0{
            
            if signature2 != ""{
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
                                let data = json["listUser"].arrayObject
                                defaults.setObject(data, forKey: "listUser")//simpan data
                                defaults.synchronize()
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
                                self.mainViewController = UINavigationController(rootViewController: swiftViewController)

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
            }else{
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
            }
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        }else if indexPath.row == 1{
            
            showLoading()
            JodohAppProvider.request(.GetUpdate(signature2), completion: { (result) in
                switch result {
                case .Success(let successResult):
                    do {
                        let json = try JSON(NSJSONSerialization.JSONObjectWithData(successResult.data, options: .MutableContainers))
                        if  json["status"].string == "success"{
                            
                            let data = NSKeyedArchiver.archivedDataWithRootObject(json["user_profile"].dictionaryObject!)
                            defaults.setObject(data, forKey: "user_profile")//simpan data
                            defaults.setValue(json["auth_token"].string , forKey: "auth_token")//simpan data
                            defaults.synchronize()
                            NSNotificationCenter.defaultCenter().postNotificationName("reloadTable", object: nil)
                            //showInfoSuccessUpdate(json["message"].string!)
                            
                        }else if (json["error"].string != nil){
                            showErrorMessage(json["error"].string!)
                        }else {
                            showErrorMessage(json["message"].string!)
                        }
                        hideLoading()
                        //print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
                        //
                        //print(json)
                    }
                    catch {
                        
                    }
                    
                case .Failure(let failureResult):
                    //print(failureResult)
                    hideLoading()
                    showErrorMessage(failureResult.nsError.localizedDescription)
                }
            })
            NSNotificationCenter.defaultCenter().postNotificationName("reloadTable", object: nil)
            let storyboard = UIStoryboard(name: "MyProfile", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("MyProfileVC") as! MyProfileViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        }else if indexPath.row == 2{
            //let storyboard = UIStoryboard(name: "Register", bundle: nil)
            //let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            //self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 3{
            //let storyboard = UIStoryboard(name: "Register", bundle: nil)
            //let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            //self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 4{
            let storyboard = UIStoryboard(name: "Package", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("PackageVC") as! PackageViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
            SCLAlertView().showInfo("Info", subTitle: "Sila langgan pakej", closeButtonTitle: "OK", colorStyle: 0x0679AD)
        }else if indexPath.row == 5{
            let storyboard = UIStoryboard(name: "Package", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("PackageVC") as! PackageViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
            SCLAlertView().showInfo("Info", subTitle: "Sila langgan pakej", closeButtonTitle: "OK", colorStyle: 0x0679AD)
        }else if indexPath.row == 6{
            let storyboard = UIStoryboard(name: "Package", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("PackageVC") as! PackageViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
            SCLAlertView().showInfo("Info", subTitle: "Sila langgan pakej", closeButtonTitle: "OK", colorStyle: 0x0679AD)
        }else if indexPath.row == 7{
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginPageVC") as! LoginPageViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        }else if indexPath.row == 8{
            let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        }else if indexPath.row == 9{
            let storyboard = UIStoryboard(name: "AboutUs", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("AboutUsVC") as! AboutUsViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        }else {
            SCLAlertView().showInfo("Info", subTitle: "Berjaya log keluar", closeButtonTitle: "Tutup", colorStyle: 0x0679AD)
            defaults.setObject("", forKey: "signature")
            defaults.setObject("", forKey: "auth_token")
            defaults.setObject("", forKey: "user_profile")
            defaults.setObject("", forKey: "user_height")
            defaults.setObject("", forKey: "email")
            defaults.setObject("", forKey: "password")
            defaults.setObject("", forKey: "listUser")
            defaults.synchronize()
            NSNotificationCenter.defaultCenter().postNotificationName("reloadSideMenuLogOut", object: nil)
            print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        }
        //self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
    }
}
