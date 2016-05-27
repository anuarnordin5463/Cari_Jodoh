//
//  AppDelegate.swift
//  JodohApp
//  test22
//  Created by Nazri Hussein on 4/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        // create viewController code...
        if(defaults.objectForKey("signature") == nil){
            defaults.setObject("", forKey: "signature")//simpan data
            defaults.synchronize()
        }
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.0/255.0, green: 182.0/255.0, blue: 211.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        UINavigationBar.appearance().tintColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        //UINavigationBar.appearance().title = UIColor(red: 0.0/255.0, green: 182.0/255.0, blue: 211.0/255.0, alpha: 1.0)
        //UINavigationBar.appearance().translucent = false
 
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let storyboard2 = UIStoryboard(name: "Register", bundle: nil)
        //let storyboard3 = UIStoryboard(name: "Login", bundle: nil) //hide ni
        //let storyboard4 = UIStoryboard(name: "MyProfile", bundle: nil)
        
        let mainViewController = storyboard.instantiateViewControllerWithIdentifier("LoginVC") as! LoginViewController //unhide ni
        //let mainViewController = storyboard3.instantiateViewControllerWithIdentifier("CustomCellsVC") as! CustomCellsController //unhide ni
        let leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftVC") as! LeftMenuViewController
        //let mainViewController = storyboard3.instantiateViewControllerWithIdentifier("PasswordExpiredVC") as! PasswordExpiredViewController //hide ni
        //let mainViewController = storyboard4.instantiateViewControllerWithIdentifier("MyProfileVC") as! MyProfileViewController
        //let mainViewController = storyboard2.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterViewController
        //let mainViewController = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
        leftViewController.mainViewController = nvc
        
        let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = mainViewController
        self.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        
        //print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

