//
//  ExtensionFile.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/25/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

extension UIViewController {
    
    func setNavigationBarItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "MenuIconWhite")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
}

extension UIApplication {
    
    class func topViewController(viewController: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        if let slide = viewController as? SlideMenuController {
            return topViewController(slide.mainViewController)
        }
        return viewController
    }
}

extension NSDate {
    class func calculateYearFromToday(date:String) -> Int{
        let dateFormater = NSDateFormatter()
        dateFormater.dateStyle = .ShortStyle
        dateFormater.locale = NSLocale(localeIdentifier: "en_GB")
        let birthdayDate = dateFormater.dateFromString(date)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now: NSDate! = NSDate()
        let calcAge = calendar.components(.Year, fromDate: birthdayDate!, toDate: now, options: [])
        let age = calcAge.year
        return age
    }
}
