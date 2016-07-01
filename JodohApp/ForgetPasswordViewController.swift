//
//  ForgetPasswordViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/30/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SCLAlertView
import SlideMenuControllerSwift
import XLForm
import SwiftyJSON

class ForgetPasswordViewController: BaseXLFormViewController, SlideMenuControllerDelegate {

    @IBOutlet weak var forgotPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLeftButton()
        forgotPasswordButton.layer.cornerRadius = 5
        self.title = "LUPA KATA LALUAN"
        //Set Color
        //Set Font Size
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Roboto-Regular", size: 20.0)!,NSForegroundColorAttributeName: UIColor.whiteColor()];
        initializeForm()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forgotPasswordButton(sender: AnyObject) {
        validateForm()
        
        if isValidate{
            let name = formValues()[Tags.ValidationUsername] as! String
        }
        if (isValidate == true){
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("PasswordExpiredVC") as! PasswordExpiredViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
        }
    }
    
    func initializeForm() {
        
        let star = [NSForegroundColorAttributeName : UIColor.redColor()]
        //let text = [NSForegroundColorAttributeName : UIColor.lightGrayColor()]
        var attrString = NSMutableAttributedString()
        //var attrText = NSMutableAttributedString()
        
        //form = XLFormDescriptor(title: "Dates") as XLFormDescriptor
        
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "")
        
        // Basic Information - Section
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("")
        form.addFormSection(section)
        
        // First Name/Given Name-------------------
        row = XLFormRowDescriptor(tag: "\(Tags.ValidationUsername)", rowType: XLFormRowDescriptorTypeEmail)
        //row.cellConfigAtConfigure["textField.placeholder"] = "User ID (Email) *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        attrString = NSMutableAttributedString(string: "Emel")
        attrString.appendAttributedString(NSAttributedString(string: "*", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        section.addFormRow(row)
                
        self.form = form
        
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
