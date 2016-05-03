//
//  ProfileViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift


class ProfileViewController: UIViewController, SlideMenuControllerDelegate {
    
    //var lblName = String()
    
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
    @IBOutlet weak var img: UIImageView!
    var imgName = UIImage()
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var user2: UINavigationItem!
    @IBOutlet weak var user: UILabel!
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setNavigationBarItem()
        img.image = imgName
        //user.text = userName
        user2.title = userName
        //self.setNavigationBarItem()
        // Do any additional setup after loading the view.
        registerButton.layer.borderWidth = 1.0
        registerButton.layer.borderColor = UIColor.blackColor().CGColor
        loginButton.layer.borderWidth = 1.0
        loginButton.layer.borderColor = UIColor.blackColor().CGColor
        //img = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        img.layer.borderWidth = 1
        img.layer.masksToBounds = false
        img.layer.borderColor = UIColor.whiteColor().CGColor
        img.layer.cornerRadius = img.frame.height/2
        img.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
