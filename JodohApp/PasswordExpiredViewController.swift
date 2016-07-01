//
//  PasswordExpiredViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/11/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import XLForm
import SCLAlertView
import SlideMenuControllerSwift

class PasswordExpiredViewController: BaseXLFormViewController, SlideMenuControllerDelegate {

    @IBOutlet weak var sahkanButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeForm()
        setupLeftButton()
        //self.setNavigationBarItem()
        sahkanButton.layer.cornerRadius = 5
        self.title = "SET KATA LALUAN"
        //Set Color
        //Set Font Size
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Roboto-Regular", size: 20.0)!,NSForegroundColorAttributeName: UIColor.whiteColor()];

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sahkanButton(sender: AnyObject) {
        
        validateForm()
        
        if isValidate{
            
            let name = formValues()[Tags.ValidationUsername] as! String
            let kataLaluanLama = formValues()[Tags.ValidationUsername] as! String
            let kataLaluanBaru = formValues()[Tags.ValidationKataLaluanBaru] as! String
            let sahKataLaluan = formValues()[Tags.ValidationSahKataLaluan] as! String
        }
        if (isValidate == true){
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("LoginPageVC") as! LoginPageViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
        }
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
        row = XLFormRowDescriptor(tag: "\(Tags.ValidationUsername)", rowType: XLFormRowDescriptorTypeName)
        //row.cellConfigAtConfigure["textField.placeholder"] = "Username *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Emel")
        attrString.appendAttributedString(NSAttributedString(string: "*", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "\(Tags.ValidationKataLaluanLama)", rowType: XLFormRowDescriptorTypePassword)
        //row.cellConfigAtConfigure["textField.placeholder"] = "E-mail *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Kata Laluan Lama")
        attrString.appendAttributedString(NSAttributedString(string: "*", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "\(Tags.ValidationKataLaluanBaru)", rowType: XLFormRowDescriptorTypePassword)
        //row.cellConfigAtConfigure["textField.placeholder"] = "Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Kata Laluan Baru")
        attrString.appendAttributedString(NSAttributedString(string: "*", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: "\(Tags.ValidationSahKataLaluan)", rowType: XLFormRowDescriptorTypePassword)
        //row.cellConfigAtConfigure["textField.placeholder"] = "Confirm Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Sah Kata Laluan")
        attrString.appendAttributedString(NSAttributedString(string: "*", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        
        self.form = form
        
    }


}
