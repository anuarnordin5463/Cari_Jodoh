//
//  Constant.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/12/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SCLAlertView

let defaults = NSUserDefaults.standardUserDefaults()

var genderArray : [Dictionary<String, AnyObject>] = [["gender_code":"Perempuan","gender_name":"Perempuan"],["gender_code":"Lelaki","gender_name":"Lelaki"]]

let url = NSURL(string: "http://4.bp.blogspot.com/_gZgKQFgDKrI/S_uJudJlvzI/AAAAAAAAEkU/OT5pjZXafKU/s320/mawi+af3.jpg")

internal struct Tags {
    static let ValidationUsername = "Email"
    static let ValidationPassword = "Password"
    static let ValidationDOB = "DOB"
    static let ValidationNewPassword = "New Password"
    static let ValidationConfirmPassword = "Confirm Password"
    static var ValidationName = "Name"
    static var ValidationFirstName = "First Name"
    static var ValidationLastName = "Last Name"
    static var ValidationDate = "Date"
    static var ValidationCountry = "Country"
    static let ValidationTown = "Town"
    static let ValidationState = "State"
    static let ValidationMobile = "Mobile"
    static let ValidationEmail = "Email"
    static var ValidationHeight = "Height"
    static var ValidationWeight = "Weight"
    static var ValidationSmokerVapes = "Smoker/Vapes"
    static var ValidationHighEducation = "High Education"
    static var ValidationOccupation = "Occupation"
    static var ValidationMaritalStatus = "Marital status"
    static var ValidationHaveAChildren = "HaveAChildren"
    static var ValidationRelationshipStatus = "Relationship Status"
    static var ValidationPolygamy = "Polygamy"
    static var ValidationFinancialLevel = "Financial Level"
    
    static var ValidationKataLaluanLama = "Kata Laluan Lama"
    static var ValidationKataLaluanBaru = "Kata Laluan Baru"
    static var ValidationSahKataLaluan = "Sah Kata Laluan"
    static var ValidationJantina = "Validation Jantina"
    
}

internal struct Tags2 {
    static let ValidationEmel = "Emel"
    static let ValidationKataLaluan = "Kata Laluan"
    static let ValidationSahKataLaluan = "SahKataLaluan"
}

func showErrorMessage(message : String){
    
    let errorView = SCLAlertView()
    errorView.showError("Error!", subTitle:message, colorStyle: 0x0679AD, closeButtonTitle : "Close")
}

func showInfoRegister(message:String){
    
    let infoView = SCLAlertView()
    infoView.showInfo("Info", subTitle: message+" Please login to proceed.", closeButtonTitle: "Okay", colorStyle: 0x0679AD)
}

func showInfoLogin(message:String){
    
    let infoView = SCLAlertView()
    infoView.showInfo("Info", subTitle: message, closeButtonTitle: "Okay", colorStyle: 0x0679AD)
}

func showInfoSuccessUpdate(message:String){
    
    let infoView = SCLAlertView()
    infoView.showInfo("Info", subTitle: message, closeButtonTitle: "Okay", colorStyle: 0x0679AD)
}

func canOpenURL(string: String?) -> Bool {
    guard let urlString = string else {return false}
    guard let url = NSURL(string: urlString) else {return false}
    if !UIApplication.sharedApplication().canOpenURL(url) {return false}
    
    //
    let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
    let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
    return predicate.evaluateWithObject(string)
}

var viewsController = UIViewController()

func showLoading(){
    
    let appDelegate = UIApplication.sharedApplication().keyWindow
    let root = appDelegate?.rootViewController
    viewsController = root!
    
    let storyboard = UIStoryboard(name: "LoadingScreen", bundle: nil)
    let loadingVC = storyboard.instantiateViewControllerWithIdentifier("LoadingScreenVC") as! LoadingScreenViewController
    loadingVC.view.backgroundColor = UIColor.clearColor()
    
    viewsController.presentViewController(loadingVC, animated: true, completion: nil)
    
}

func hideLoading(){
    
    viewsController.presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
    
}

func formatDate(date:NSDate) -> String{
    
    let formater = NSDateFormatter()
    formater.dateFormat = "dd-MM-yyyy"
    return formater.stringFromDate(date)
    
}

func stringToDate(date:String) -> NSDate{
    
    let formater = NSDateFormatter()
    formater.dateFormat = "yyyy-MM-dd"
    let twentyFour = NSLocale(localeIdentifier: "en_GB")
    formater.locale = twentyFour
    return formater.dateFromString(date)!
    
}
