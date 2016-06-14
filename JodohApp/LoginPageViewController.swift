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
import Eureka

class LoginPageViewController: BaseXLFormViewController,SlideMenuControllerDelegate {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        setupLeftButton()
        initializeForm()
        registerButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        self.title = "LOG MASUK"
        //Set Color
        //Set Font Size
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Roboto-Regular", size: 20.0)!,NSForegroundColorAttributeName: UIColor.whiteColor()];
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
            
            defaults.setValue(name , forKey: "email")//simpan data
            defaults.setValue(pass , forKey: "password")//simpan data
            defaults.synchronize()
            
            showLoading()
            
            JodohAppProvider.request(.Login(name,pass), completion: { (result) in
                switch result {
                case .Success(let successResult):
                    do {
                        let json = try JSON(NSJSONSerialization.JSONObjectWithData(successResult.data, options: .MutableContainers))
                        
                        if  json["status"].string == "success"{
                            
                            showInfoLogin(json["message"].string!)
                            //print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
                            //let defaults = NSUserDefaults.standardUserDefaults()//declare default tok save data
                            defaults.setValue(json["signature"].string , forKey: "signature")//simpan data
                            defaults.setValue(json["auth_token"].string , forKey: "auth_token")//simpan data
                            defaults.synchronize()
                            //print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
                            NSNotificationCenter.defaultCenter().postNotificationName("reloadSideMenu", object: nil)
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
                            self.navigationController!.pushViewController(manageFlightVC, animated: true)
 
                            
                        }else{
                            showErrorMessage(json["message"].string!)
                        }
                        hideLoading()
                        print(json)
                    }
                    catch {
                        
                    }
                    
                case .Failure(let failureResult):
                    //print(failureResult)
                    hideLoading()
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
        //reloadAlertView("USER ID (Email):*")
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("ForgotPasswordVC") as! ForgetPasswordViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
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
        attrString = NSMutableAttributedString(string: "Emel")
        attrString.appendAttributedString(NSAttributedString(string: "*", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.addValidator(XLFormValidator.emailValidator())
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags.ValidationPassword, rowType: XLFormRowDescriptorTypePassword, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.required = true
        attrString = NSMutableAttributedString(string: "Kata Laluan")
        attrString.appendAttributedString(NSAttributedString(string: "*", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        section.addFormRow(row)
        
        self.form = form
        
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
}
