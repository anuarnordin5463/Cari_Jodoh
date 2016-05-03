//
//  RegisterViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/26/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class RegisterViewController: UIViewController, SlideMenuControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
        print("RegisterButtonPressed")
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
     //rename
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("LoginPageVC") as! LoginPageViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
}
