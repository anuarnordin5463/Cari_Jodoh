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
    var menuIcon:[String] = ["homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon"]
    //var imgName = UIImage()---
    //var userName = String()---
    var hideRow : Bool = false
    let signature = defaults.objectForKey("signature")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userId.text = self.items[indexPath.item]
        //userImage.image = self.pics[indexPath.item]
        //userImage.backgroundColor = UIColor.whiteColor() // make cell more visible in our example project
        userId.text = signature as? String
        //defaults.objectForKey("auth_token")
        //userId.text = userName---
        userImage.image = UIImage(named:"homePic")
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
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginPageVC") as! LoginPageViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else if indexPath.row == 2{
            let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterViewController
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
            //print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }
        self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
    }
}
