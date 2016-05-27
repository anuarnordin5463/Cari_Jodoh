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
//defaults.setValue("", forKey: "signature")//simpan data
//defaults.synchronize()

//let dataSave = defaults.objectForKey("user_profile") as! NSData
//let tempData = NSKeyedUnarchiver.unarchiveObjectWithData(dataSave)
//let url = NSURL(string: tempData!["user_image"] as! String)

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
}

func showErrorMessage(message : String){
    
    let errorView = SCLAlertView()
    errorView.showError("Error!", subTitle:message, colorStyle: 0x82EBFF, closeButtonTitle : "Close")
}

func showInfoRegister(message:String){
    
    let infoView = SCLAlertView()
    infoView.showInfo("Info", subTitle: message+" Please login to proceed.", closeButtonTitle: "Okay", colorStyle: 0x82EBFF)
}

func showInfoLogin(message:String){
    
    let infoView = SCLAlertView()
    infoView.showInfo("Info", subTitle: message+" Please fill all the details to proceed.", closeButtonTitle: "Okay", colorStyle: 0x82EBFF)
}

func showInfoSuccessUpdate(message:String){
    
    let infoView = SCLAlertView()
    infoView.showInfo("Info", subTitle: message, closeButtonTitle: "Okay", colorStyle: 0x82EBFF)
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

