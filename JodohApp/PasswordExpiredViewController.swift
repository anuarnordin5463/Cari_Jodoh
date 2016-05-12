//
//  PasswordExpiredViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/11/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import XLForm
import SlideMenuControllerSwift

class PasswordExpiredViewController: XLFormViewController, SlideMenuControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeForm()
        self.setNavigationBarItem()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeForm() {
        
        //form = XLFormDescriptor(title: "Dates") as XLFormDescriptor
        let star = [NSForegroundColorAttributeName : UIColor.redColor()]
        var attrString = NSMutableAttributedString()
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "")
        
        // Basic Information - Section
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("")
        form.addFormSection(section)
        
        // First Name/Given Name-------------------
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Username *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "User ID (Email)")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "E-mail *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Current Password")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "New Password")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Confirm Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Confirm Password")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        self.form = form
        
    }


}
