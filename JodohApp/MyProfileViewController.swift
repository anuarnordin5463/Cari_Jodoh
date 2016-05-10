//
//  MyProfileViewController.swift
//  JodohApps
//
//  Created by Nazri Hussein on 4/28/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import XLForm
import SlideMenuControllerSwift

class MyProfileViewController: XLFormViewController, SlideMenuControllerDelegate {

    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.layer.cornerRadius = 5
        //submitButton.frame = CGRectMake(0, 0, 0, 45) // (x, y, width, height)
        
        self.setNavigationBarItem()
        initializeForm()
        //continueBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
    
    
    func initializeForm() {
        
        //form = XLFormDescriptor(title: "Dates") as XLFormDescriptor
        let star = [NSForegroundColorAttributeName : UIColor.redColor()]
        //let text = [NSForegroundColorAttributeName : UIColor.blackColor()]
        var attrString = NSMutableAttributedString()
        //var attrText = NSMutableAttributedString()
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "") //as XLFormDescriptor
        
        // Basic Information - Section
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("PERSONAL INFORMATION")
        form.addFormSection(section)
        
        // First Name/Given Name-------------------
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Name *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        attrString = NSMutableAttributedString(string: "Name")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        section.addFormRow(row)
        
        // Selector Push
        /*row = XLFormRowDescriptor(tag: "push", rowType:XLFormRowDescriptorTypeSelectorPickerView, title:"Push")
        var tempArray:[AnyObject] = [AnyObject]()
        for title in 100...200{
            tempArray.append(XLFormOptionsObject(value: title, displayText: "\(title)"))
        }
        
        row.selectorOptions = tempArray
        //row.value = tempArray[0]
        section.addFormRow(row)*/
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeDate , title:"Date of Birth *")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Date of Birth *"
        row.value = NSDate()
        row.required = true
        section.addFormRow(row)
        
        // Selector Picker View
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Select *")
        row.selectorOptions = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
        //row.value = "Option 4"
        section.addFormRow(row)*/
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypePhone, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Mobile *"
        row.required = true
        attrString = NSMutableAttributedString(string: "Mobile")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypePhone, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Height *"
        row.required = true
        attrString = NSMutableAttributedString(string: "Height")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        section.addFormRow(row)
        
        // Height
        /*row = XLFormRowDescriptor(tag: "", rowType:XLFormRowDescriptorTypeSelectorPickerView, title:"Height *")
         var tempArray:[AnyObject] = [AnyObject]()
         for title in 100...200{
         tempArray.append(XLFormOptionsObject(value: title, displayText: "\(title) cm"))
         }
         row.selectorOptions = tempArray
         //row.value = tempArray[0]
         section.addFormRow(row)*/
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypePhone, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Weight *"
        attrString = NSMutableAttributedString(string: "Weight")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        
        section.addFormRow(row)
        
        // Weight
        /*row = XLFormRowDescriptor(tag: "", rowType:XLFormRowDescriptorTypeSelectorPickerView, title:"Weight *")
        var tempArray1:[AnyObject] = [AnyObject]()
        for title in 100...200{
            tempArray1.append(XLFormOptionsObject(value: title, displayText: "\(title) kg"))
        }
        row.selectorOptions = tempArray1
        //row.value = tempArray[0]
        section.addFormRow(row)*/
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "Religion *"
        row.required = true
        section.addFormRow(row)*/
        
        // Religion
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Religion *")
        row.selectorOptions = ["Islam"]
        row.value = "Islam"
        section.addFormRow(row)*/
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "Smoker/Vapes *"
        row.required = true
        section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Smoker/Vapes *")
        row.selectorOptions = ["Yes", "No"]
        //row.value = "Option 4"
        section.addFormRow(row)
        
        // Basic Information - Section----------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("RESIDENCE INFORMATION")
        form.addFormSection(section)
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "Country *"
        row.required = true
        section.addFormRow(row)*/
        
        // Smoker/Vapes
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Country *")
        row.selectorOptions = ["Malaysia"]
        row.value = "Malaysia"
        section.addFormRow(row)*/
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "State *"
        row.required = true
        section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"State *")
        row.selectorOptions = ["Johor","Kedah","Kelantan","Melaka","Negeri Sembilan","Pahang","Perak","Perlis","Pulau Pinang","Sabah","Sarawak","Selangor","Terengganu","Wilayah Persekutuan"]
        //row.value = "Option 4"
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Town *"
        attrString = NSMutableAttributedString(string: "Town")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        section.addFormRow(row)
        
        // Basic Information - Section--------------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("EDUCATION INFORMATION")
        form.addFormSection(section)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "High Education *"
        attrString = NSMutableAttributedString(string: "High Education")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Occupation *"
        attrString = NSMutableAttributedString(string: "Occupation")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        section.addFormRow(row)
        
        // Basic Information - Section------------------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("STATUS INFORMATION")
        form.addFormSection(section)
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "Marital status *"
        row.required = true
        section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Marital status *")
        row.selectorOptions = ["Divorced", "Married", "Single", "Widowed"]
        //row.value = "Option 4"
        section.addFormRow(row)

        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "Have a children *"
        row.required = true
        section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Have a children *")
        row.selectorOptions = ["Yes", "No"]
        //row.value = "Option 4"
        section.addFormRow(row)
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "Relationship Status *"
        row.required = true
        section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Marital status *")
        row.selectorOptions = ["Serius mencari", "Tidak serius mencari", "Sedang mengenali seseorang", "Tidak pasti"]
        //row.value = "Option 4"
        section.addFormRow(row)
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "Polygamy *"
        row.required = true
        section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Polygamy *")
        row.selectorOptions = ["Agreed", "Can be discussed", "Do not agree", "Haven\'t thought yet"]
        //row.value = "Option 4"
        section.addFormRow(row)
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "Financial level *"
        row.required = true
        section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Financial level *")
        row.selectorOptions = ["Unemployed", "Low income", "Middle income", "High income","Need more information"]
        //row.value = "Option 4"
        section.addFormRow(row)
        
        self.form = form
        
    }

    

}
