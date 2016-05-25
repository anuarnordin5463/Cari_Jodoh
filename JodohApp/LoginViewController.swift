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
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        greetingLabel.layer.cornerRadius = 5
        greetingLabel.layer.masksToBounds = true
        //greetingLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        //greetingLabel.numberOfLines = 2
        self.setNavigationBarItem()
        //self.navigationController?.navigationBarHidden =  false
        //self.title = "Cari Jodoh"
        //Set Color
        //Set Font Size
        //self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "ALHAMBRA", size: 25.0)!,NSForegroundColorAttributeName: UIColor.whiteColor()];
        // Do any additional setup after loading the view.
        //print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func registerButtonPressed(sender: AnyObject) {
        print("RegisterButtonPressed")
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }

    @IBAction func loginButtonPressed(sender: AnyObject) {
        print("LoginButtonPressed")
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("LoginPageVC") as! LoginPageViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
}
