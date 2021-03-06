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
    var menuSections:[String] = ["Home", "Update Profile", "Favourite", "Chat", "Search", "About Us", "T&C", "FAQ", "Setting", "Logout"]
    var menuIcon:[String] = ["homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon"]
    
    var hideRow : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userId.text = self.items[indexPath.item]
        //userImage.image = self.pics[indexPath.item]
        //userImage.backgroundColor = UIColor.whiteColor() // make cell more visible in our example project
        userId.text = String("MBT 6571, 28 TAHUN")
        userImage.image = UIImage(named:"mawi")
        userImage.layer.borderWidth = 1
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.lightGrayColor().CGColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
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
        }else if indexPath.row == 8{
            //let storyboard = UIStoryboard(name: "Register", bundle: nil)
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }else{
            SCLAlertView().showInfo("Info", subTitle: "You have succesfully logout", closeButtonTitle: "Close", colorStyle: 0x82EBFF)
            defaults.setObject("", forKey: "userInfo")
            defaults.synchronize()
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }
        self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
    }
}
