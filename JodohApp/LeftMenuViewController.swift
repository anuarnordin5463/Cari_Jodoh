//
//  LeftMenuViewController.swift
//  JodohApps
//
//  Created by Nazri Hussein on 4/25/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SCLAlertView

class LeftMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    var mainViewController: UIViewController!
    var menuSections:[String] = ["Laman Utama", "Kemaskini Profil", "Galeri Foto", "Kegemaran", "Sembang", "Carian", "Tetapan", "Tentang Kami","Logout"]
    var menuIcon:[String] = ["lamanUtama", "kemaskiniProfil", "galeriPhoto", "kegemaran", "sembang", "carian", "tetapanCarian", "tentangKami", "logKeluar"]
    //var imgName = UIImage()---
    //var userName = String()---
    var hideRow : Bool = false
    //var image: UIImage!
    var signature = defaults.objectForKey("signature")
    var signature2 = defaults.objectForKey("signature") as! String
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = UIColor.redColor()
        /*if canOpenURL("http://s63.podbean.com/pb/c5c63ffddb3998f99fa4cfdc87f040c3/5743cc3a/data1/blogs32/609334/uploads/mawi.jpg") {
            print("valid url")
            if (signature2 == "") {
                userImage.image = UIImage(named:"homePic")
            } else {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                    let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                    dispatch_async(dispatch_get_main_queue(), {
                        self.userImage.image = UIImage(data: data!)
                    })
                }
            }
        } else {
            print("invalid url")
        }*/
        
        if (signature2 == "") {
            userImage.image = UIImage(named:"homePic")
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                dispatch_async(dispatch_get_main_queue(), {
                    self.userImage.image = UIImage(data: data!)
                })
            }
        }

        //NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LeftMenuViewController.refreshSideMenu(_:)), name: "reloadSideMenu", object: nil)---fromlogin
        //userId.text = self.items[indexPath.item]
        //userImage.image = self.pics[indexPath.item]
        //userImage.backgroundColor = UIColor.whiteColor() // make cell more visible in our example project
        //userImage.image = image
        //userImage.image = UIImage(named:"mawi")
        userId.text = signature as? String
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
        hideRow = true
        self.leftTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.row == 0 && hideRow == true) ||
            (indexPath.row == 1 && hideRow == true) ||
            (indexPath.row == 2 && hideRow == true) ||
            (indexPath.row == 3 && hideRow == true) ||
            (indexPath.row == 4 && hideRow == true) ||
            (indexPath.row == 5 && hideRow == true) ||
            (indexPath.row == 6 && hideRow == true) ||
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
        
        if indexPath.row == 0{
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 1{
            let storyboard = UIStoryboard(name: "MyProfile", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("MyProfileVC") as! MyProfileViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 2{
            //let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 3{
            //let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 4{
            //let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 5{
            //let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 6{
            //let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 7{
            //let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else{
            SCLAlertView().showInfo("Info", subTitle: "You have succesfully logout", closeButtonTitle: "Close", colorStyle: 0x82EBFF)
            defaults.setObject("", forKey: "signature")
            defaults.setObject("", forKey: "auth_token")
            defaults.synchronize()
            print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }
        self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
    }
}
