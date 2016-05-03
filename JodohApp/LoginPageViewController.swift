//
//  LoginPageViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/28/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SCLAlertView

class LoginPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButtonPressedPass(sender: AnyObject) {
        print("LoginButtonPressed")
        let storyboard = UIStoryboard(name: "MyProfile", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("MyProfileVC") as! MyProfileViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
    
    @IBAction func ForgotPasswordButtonPressed(sender: AnyObject) {
        reloadAlertView("USER ID (Email):*")
    }
    
    var email = UITextField()
    var tempEmail = String()
    
    func reloadAlertView(msg : String){
        
        let alert = SCLAlertView()
        email = alert.addTextField("Enter email")
        email.text = tempEmail
        alert.addButton("Submit", target: self, selector: #selector(LoginPageViewController.ForgotPasswordButtonPressed))
        alert.showEdit("Forgot Password", subTitle: msg, colorStyle: 0x82EBFF, closeButtonTitle : "Close")
    }
    
    @IBAction func RegisterButtonPressed(sender: AnyObject) {
        print("RegisterButtonPressed")
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }

}
