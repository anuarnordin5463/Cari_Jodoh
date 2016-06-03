//
//  RegisterViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/26/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import XLForm
import SwiftyJSON
import SCLAlertView

class RegisterViewController: BaseXLFormViewController, SlideMenuControllerDelegate {

    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        setupLeftButton()
        initializeForm()
        registerButton.layer.cornerRadius = 5
        self.title = "DAFTAR AKAUN"
        //Set Color
        //Set Font Size
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Roboto-Regular", size: 25.0)!,NSForegroundColorAttributeName: UIColor.whiteColor()];
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
        
        validateForm()
        
        if isValidate{
  
            if formValues()[Tags.ValidationPassword]! as! String != formValues()[Tags.ValidationConfirmPassword]! as! String {
                showErrorMessage("Confirm password incorrect")
            }
            else{
            let name = formValues()[Tags.ValidationUsername] as! String
            let pass = formValues()[Tags.ValidationPassword] as! String
            let confirmPass = formValues()[Tags.ValidationConfirmPassword] as! String
            
            JodohAppProvider.request(.Register(name,pass,confirmPass), completion: { (result) in
                switch result {
                case .Success(let successResult):
                    do {
                        let json = try JSON(NSJSONSerialization.JSONObjectWithData(successResult.data, options: .MutableContainers))
                        
                        if  json["status"].string == "success"{
                            
                            showInfoRegister(json["message"].string!)
                            
                            let storyboard = UIStoryboard(name: "Login", bundle: nil)
                            let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("LoginPageVC") as! LoginPageViewController
                            self.navigationController!.pushViewController(manageFlightVC, animated: true)
                            
                        }else{
                            showErrorMessage(json["message"].string!)
                        }
                        
                        print(json)
                    }
                    catch {
                        
                    }
                    
                case .Failure(let failureResult):
                    //print(failureResult)
                    showErrorMessage(failureResult.nsError.localizedDescription)
                }
            })
        }
            
        }else{
            print("false,value can't be empty")
        }
            
    
        /*sblum
        if isValidate{
            print("correct")
            print(formValues())
            //let name = formValues()["Email"] as! String
            //let pass = formValues()["Password"] as! String
            //let title = (formValues()[Tags.ValidationTitle]! as! XLFormOptionsObject).valueData() as! String
            
        }else{
            print("false,value can't be empty")
        }
        //print(formValues()["Name"])
        sblum*/
        
        //let storyboard = UIStoryboard(name: "Login", bundle: nil)
     //rename
        //let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("LoginPageVC") as! LoginPageViewController
        //self.navigationController!.pushViewController(manageFlightVC, animated: true)
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
        
        /*
        // First Name/Given Name-------------------
        row = XLFormRowDescriptor(tag: Tags.ValidationFirstName, rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Username *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Username")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        */
        
        row = XLFormRowDescriptor(tag: Tags.ValidationUsername, rowType: XLFormRowDescriptorTypeEmail, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "E-mail *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Emel")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.addValidator(XLFormValidator.emailValidator())
        row.required = true
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.ValidationPassword, rowType: XLFormRowDescriptorTypePassword, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Kata Laluan")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.ValidationConfirmPassword, rowType: XLFormRowDescriptorTypePassword, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Confirm Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Sah Kata Laluan")
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
