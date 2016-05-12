//
//  LeftMenuViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/25/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var leftTableView: UITableView!
    
    var mainViewController: UIViewController!
    var menuSections:[String] = ["Home", "Update Profile", "Favourite", "Chat", "Search", "About Us", "T&C", "FAQ", "Setting", "Logout"]
    var menuIcon:[String] = ["homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon", "homeIcon"]
    var hideRow : Bool = false
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    
    /*func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
    }*/
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView.init(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
        let label = UILabel.init(frame:CGRectMake(15, 0, tableView.frame.size.width, 50))
        label.font = UIFont(name: "System", size: 28.0)
        label.tintColor = UIColor.whiteColor()
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.clearColor()
        
        let frame = CGRectMake(0, 0, self.view.frame.size.width, 200)
        let headerImageView = UIImageView(frame: frame)
        let image: UIImage = UIImage(named: "nora")!
        headerImageView.image = image
        leftTableView.tableHeaderView = headerImageView

        if hideRow == true{
            //let userInfo = defaults.objectForKey("userInfo") as! NSMutableDictionary
            //let greetMsg = String(format: "Hi, %@", userInfo["first_name"] as! String)
            //label.text = greetMsg
        }else{
            label.text = "6571, 25"
            label.textAlignment = NSTextAlignment.Center;
        }
        
        view.addSubview(label)
        //view.backgroundColor = UIColor(red: 111.0/255.0, green: 113.0/255.0, blue: 121.0/255.0, alpha: 1.0)
        
        return view
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
        }else{
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }
        
        self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
    }
}
