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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = leftTableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        //wrong
        if indexPath.row == 0{
            cell.textLabel?.text = "Home"
        }else if indexPath.row == 1{
            cell.textLabel?.text = "Login"
        }else if indexPath.row == 2{
            cell.textLabel?.text = "Register"
        }else if indexPath.row == 3{
            cell.textLabel?.text = "Search"
        }else if indexPath.row == 4{
            cell.textLabel?.text = "About Us"
        }else if indexPath.row == 5{
            cell.textLabel?.text = "T&C"
        }else if indexPath.row == 6{
            cell.textLabel?.text = "FAQ"
        }else{
            //cell.textLabel?.text = "Page \(indexPath.row)"
        }
        
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
        }else{
            let swiftViewController = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
            self.mainViewController = UINavigationController(rootViewController: swiftViewController)
        }
        
        self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
    }
}
