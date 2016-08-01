//
//  LoginViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/26/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class LoginViewController: UIViewController, SlideMenuControllerDelegate{
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var greetingLabel2: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        greetingLabel.layer.cornerRadius = 5
        greetingLabel.layer.masksToBounds = true
        greetingLabel2.layer.cornerRadius = 5
        greetingLabel2.layer.masksToBounds = true
        self.setNavigationBarItem()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func registerButtonPressed(sender: AnyObject) {
        //print("RegisterButtonPressed")
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }

    @IBAction func loginButtonPressed(sender: AnyObject) {
        //print("LoginButtonPressed")
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("LoginPageVC") as! LoginPageViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
}
