//
//  LoginPageViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/28/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SCLAlertView
import SlideMenuControllerSwift
import XLForm
import SwiftyJSON

class LoginPageViewController: BaseXLFormViewController,SlideMenuControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        //setupLeftButton()
        initializeForm()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButtonPressedPass(sender: AnyObject) {
        
        validateForm()
        
        if isValidate{
            //print("correct")
            //print(formValues())
            let name = formValues()[Tags.ValidationUsername] as! String
            let pass = formValues()[Tags.ValidationPassword] as! String
            
            JodohAppProvider.request(.Login(name,pass), completion: { (result) in
                switch result {
                case .Success(let successResult):
                    do {
                        let json = try JSON(NSJSONSerialization.JSONObjectWithData(successResult.data, options: .MutableContainers))
                        
                        if  json["status"].string == "success"{
                            
                            let defaults = NSUserDefaults.standardUserDefaults()
                            defaults.setObject(json["signature"].string , forKey: "signature")
                            defaults.setObject(json["auth_token"].string , forKey: "auth_token")
                            defaults.synchronize()
                            
                            let storyboard = UIStoryboard(name: "MyProfile", bundle: nil)
                            let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("MyProfileVC") as! MyProfileViewController
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
            
        }else{
            print("false,value can't be empty")
        }
        
        //
        
        //JodohAppProvider.request(.Login(, completion: <#T##Completion##Completion##(result: Result<Response, Error>) -> ()#>)
        //print(name)
        //let storyboard = UIStoryboard(name: "MyProfile", bundle: nil)
        //let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("MyProfileVC") as! MyProfileViewController
        //self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
    
    @IBAction func ForgotPasswordButtonPressed(sender: AnyObject) {
        reloadAlertView("USER ID (Email):*")
    }
    
    var email = UITextField()
    var tempEmail = String()
    
    func reloadAlertView(msg : String){
        
        let alert = SCLAlertView()
        email = alert.addTextField("Enter email")
        email.text = tempEmail
        alert.addButton("Submit", target: self, selector: #selector(LoginPageViewController.ForgotPasswordButtonPressed))
        alert.showEdit("Forgot Password", subTitle: msg, colorStyle: 0x82EBFF, closeButtonTitle : "Close")
    }
    
    @IBAction func RegisterButtonPressed(sender: AnyObject) {
        print("RegisterButtonPressed")
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("RegisterVC") as! RegisterViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
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
        row = XLFormRowDescriptor(tag: Tags.ValidationUsername, rowType: XLFormRowDescriptorTypeEmail, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "User ID (Email) *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        attrString = NSMutableAttributedString(string: "User ID (Email)")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.ValidationPassword, rowType: XLFormRowDescriptorTypePassword, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        attrString = NSMutableAttributedString(string: "Password")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        section.addFormRow(row)
        
        self.form = form
        
    }
}
