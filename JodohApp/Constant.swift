//
//  Constant.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/12/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SCLAlertView

class Constant: NSObject {

}
internal struct Tags {
    static let ValidationUsername = "Email"
    static let ValidationPassword = "Password"
    static let ValidationNewPassword = "New Password"
    static let ValidationConfirmPassword = "Confirm Password"
    static var ValidationTitle = "Title"
    static var ValidationFirstName = "First Name"
    static var ValidationLastName = "Last Name"
    static var ValidationDate = "Date"
    static let ValidationAddressLine1 = "Address Line 1"
    static let ValidationAddressLine2 = "Address Line 2"
    static let ValidationAddressLine3 = "Address Line 3"
    static var ValidationCountry = "Country"
    static let ValidationTownCity = "Town/City"
    static let ValidationState = "State"
    static let ValidationPostcode = "Postcode"
    static let ValidationMobileHome = "Mobile/Home"
    static let ValidationAlternate = "Alternate"
    static let ValidationFax = "Fax"
    static let ValidationEmail = "Email"
    static var ValidationTravelDoc = "Travel Document"
    static var ValidationDocumentNo = "Document No"
    static var ValidationExpiredDate = "Expiration Date"
    static var ValidationEnrichLoyaltyNo = "Bonuslink"
    static var ValidationTravelWith = "Traveling with"
    static var ValidationGender = "Gender"
    static var ValidationPurpose = "Purpose"
    static var ValidationCompanyName = "Company Name"
    static var ValidationCardType = "Card Type"
    static var ValidationCardNumber = "Card Number"
    static var ValidationCardExpiredDate = "Card Expiration Date"
    static var ValidationHolderName = "Holder Name"
    static var ValidationCcvNumber = "CCV/CVC Number"
    static var ValidationConfirmationNumber = "Confirmation Number"
    static var ValidationDeparting = "Departing"
    static var ValidationArriving = "Arriving"
    static var ValidationSSRList = "Meals"
    static var HideSection = "hide"
    
}

func showErrorMessage(message : String){
    
    let errorView = SCLAlertView()
    errorView.showError("Error!", subTitle:message, colorStyle: 0x82EBFF, closeButtonTitle : "Close")
    
}


