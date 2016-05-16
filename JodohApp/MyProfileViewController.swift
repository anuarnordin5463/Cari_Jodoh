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

class MyProfileViewController: BaseXLFormViewController, SlideMenuControllerDelegate {
    
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
        
        validateForm()
        
        if isValidate{
            //print("correct")
            //print(formValues())
            //let name = formValues()["Email"] as! String
            //let pass = formValues()["Password"] as! String
            //let title = (formValues()[Tags.ValidationSmokerVapes]! as! XLFormOptionsObject).valueData() as! String
            
            
        }else{
            print("false,value can't be empty")
        }
        
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
        //self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
    
    
    func initializeForm() {
        
        //form = XLFormDescriptor(title: "Dates") as XLFormDescriptor
        let star = [NSForegroundColorAttributeName : UIColor.redColor()]
        let text = [NSForegroundColorAttributeName : UIColor.lightGrayColor()]
        var attrString = NSMutableAttributedString()
        var attrText = NSMutableAttributedString()
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "") //as XLFormDescriptor
        
        // Basic Information - Section
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("PERSONAL INFORMATION")
        form.addFormSection(section)
        
        // First Name/Given Name-------------------
        row = XLFormRowDescriptor(tag: Tags.ValidationName, rowType: XLFormRowDescriptorTypeName, title:"")
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
        row = XLFormRowDescriptor(tag: Tags.ValidationDOB, rowType: XLFormRowDescriptorTypeDate , title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Date of Birth *"
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Date of Birth", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.required = true
        row.value = NSDate()
        section.addFormRow(row)
        
        // Selector Picker View
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"Select *")
         row.selectorOptions = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
         //row.value = "Option 4"
         section.addFormRow(row)*/
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationMobile, rowType: XLFormRowDescriptorTypePhone, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Mobile *"
        row.required = true
        attrString = NSMutableAttributedString(string: "Mobile")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationHeight, rowType: XLFormRowDescriptorTypePhone, title:"")
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
        row = XLFormRowDescriptor(tag: Tags.ValidationWeight, rowType: XLFormRowDescriptorTypePhone, title:"")
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
        row = XLFormRowDescriptor(tag: Tags.ValidationSmokerVapes, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempArraySmoker:[AnyObject] = [AnyObject]()
        tempArraySmoker.append(XLFormOptionsObject(value: "Yes", displayText: "Yes"))
        tempArraySmoker.append(XLFormOptionsObject(value: "No", displayText: "No"))
        row.selectorOptions = tempArraySmoker
        row.value = tempArraySmoker[0]
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Smoker/Vapes", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
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
        row = XLFormRowDescriptor(tag: Tags.ValidationState, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //row.selectorOptions = ["Johor","Kedah","Kelantan","Melaka","Negeri Sembilan","Pahang","Perak","Perlis","Pulau Pinang","Sabah","Sarawak","Selangor","Terengganu","Wilayah Persekutuan"]
        //row.value = "Option 4"
        var tempArrayState:[AnyObject] = [AnyObject]()
        tempArrayState.append(XLFormOptionsObject(value: "Johor", displayText: "Johor"))
        tempArrayState.append(XLFormOptionsObject(value: "Kedah", displayText: "Kedah"))
        tempArrayState.append(XLFormOptionsObject(value: "Kelantan", displayText: "Kelantan"))
        tempArrayState.append(XLFormOptionsObject(value: "Melaka", displayText: "Melaka"))
        tempArrayState.append(XLFormOptionsObject(value: "Negeri Sembilan", displayText: "Negeri Sembilan"))
        tempArrayState.append(XLFormOptionsObject(value: "Pahang", displayText: "Pahang"))
        tempArrayState.append(XLFormOptionsObject(value: "Perak", displayText: "Perak"))
        tempArrayState.append(XLFormOptionsObject(value: "Perlis", displayText: "Perlis"))
        tempArrayState.append(XLFormOptionsObject(value: "Pulau Pinang", displayText: "Pulau Pinang"))
        tempArrayState.append(XLFormOptionsObject(value: "Sabah", displayText: "Sabah"))
        tempArrayState.append(XLFormOptionsObject(value: "Sarawak", displayText: "Sarawak"))
        tempArrayState.append(XLFormOptionsObject(value: "Selangor", displayText: "Selangor"))
        tempArrayState.append(XLFormOptionsObject(value: "Terengganu", displayText: "Terengganu"))
        tempArrayState.append(XLFormOptionsObject(value: "Wilayah Persekutuan", displayText: "Wilayah Persekutuan"))
        row.selectorOptions = tempArrayState
        row.value = tempArrayState[0]
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "State", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationTown, rowType: XLFormRowDescriptorTypeName, title:"")
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
        row = XLFormRowDescriptor(tag: Tags.ValidationHighEducation, rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "High Education *"
        attrString = NSMutableAttributedString(string: "High Education")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationOccupation, rowType: XLFormRowDescriptorTypeName, title:"")
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
        row = XLFormRowDescriptor(tag: Tags.ValidationMaritalStatus, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //row.selectorOptions = ["Divorced", "Married", "Single", "Widowed"]
        var tempArrayMarital:[AnyObject] = [AnyObject]()
        tempArrayMarital.append(XLFormOptionsObject(value: "Divorced", displayText: "Divorced"))
        tempArrayMarital.append(XLFormOptionsObject(value: "Married", displayText: "Married"))
        tempArrayMarital.append(XLFormOptionsObject(value: "Single", displayText: "Single"))
        tempArrayMarital.append(XLFormOptionsObject(value: "Widowed", displayText: "Widowed"))
        row.selectorOptions = tempArrayMarital
        row.value = tempArrayMarital[0]
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Marital status", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        //row.value = "Option 4"
        section.addFormRow(row)
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
         row.cellConfigAtConfigure["textField.placeholder"] = "Have a children *"
         row.required = true
         section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationHaveAChildren, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //row.selectorOptions = ["Yes", "No"]
        //row.value = "Option 4"
        var tempArrayChildren:[AnyObject] = [AnyObject]()
        tempArrayChildren.append(XLFormOptionsObject(value: "Yes", displayText: "Yes"))
        tempArrayChildren.append(XLFormOptionsObject(value: "No", displayText: "No"))
        row.selectorOptions = tempArrayChildren
        row.value = tempArrayChildren[0]
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Have a children", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
         row.cellConfigAtConfigure["textField.placeholder"] = "Relationship Status *"
         row.required = true
         section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationRelationshipStatus, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //row.selectorOptions = ["Serius mencari", "Tidak serius mencari", "Sedang mengenali seseorang", "Tidak pasti"]
        //row.value = "Option 4"
        var tempArrayRS:[AnyObject] = [AnyObject]()
        tempArrayRS.append(XLFormOptionsObject(value: "Serius mencari", displayText: "Serius mencari"))
        tempArrayRS.append(XLFormOptionsObject(value: "Tidak serius mencari", displayText: "Tidak serius mencari"))
        tempArrayRS.append(XLFormOptionsObject(value: "Sedang mengenali seseorang", displayText: "Sedang mengenali seseorang"))
        tempArrayRS.append(XLFormOptionsObject(value: "Tidak pasti", displayText: "Tidak pasti"))
        row.selectorOptions = tempArrayRS
        row.value = tempArrayRS[0]
        attrString = NSMutableAttributedString(string: "Relationship Status", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        section.addFormRow(row)
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
         row.cellConfigAtConfigure["textField.placeholder"] = "Polygamy *"
         row.required = true
         section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationPolygamy, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //row.selectorOptions = ["Agreed", "Can be discussed", "Do not agree", "Haven\'t thought yet"]
        var tempArrayPolygamy:[AnyObject] = [AnyObject]()
        tempArrayPolygamy.append(XLFormOptionsObject(value: "Agreed", displayText: "Agreed"))
        tempArrayPolygamy.append(XLFormOptionsObject(value: "Can be discussed", displayText: "Can be discussed"))
        tempArrayPolygamy.append(XLFormOptionsObject(value: "Do not agree", displayText: "Do not agree"))
        tempArrayPolygamy.append(XLFormOptionsObject(value: "Haven\'t thought yet", displayText: "Haven\'t thought yet"))
        row.selectorOptions = tempArrayPolygamy
        row.value = tempArrayPolygamy[0]
        attrString = NSMutableAttributedString(string: "Polygamy", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        //row.value = "Option 4"
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        section.addFormRow(row)
        
        // First Name/Given Name
        /*row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
         row.cellConfigAtConfigure["textField.placeholder"] = "Financial level *"
         row.required = true
         section.addFormRow(row)*/
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationFinancialLevel, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //row.selectorOptions = ["Unemployed", "Low income", "Middle income", "High income","Need more information"]
        var tempArrayFL:[AnyObject] = [AnyObject]()
        tempArrayFL.append(XLFormOptionsObject(value: "Agreed", displayText: "Agreed"))
        tempArrayFL.append(XLFormOptionsObject(value: "Can be discussed", displayText: "Can be discussed"))
        tempArrayFL.append(XLFormOptionsObject(value: "Do not agree", displayText: "Do not agree"))
        tempArrayFL.append(XLFormOptionsObject(value: "Haven\'t thought yet", displayText: "Haven\'t thought yet"))
        row.selectorOptions = tempArrayFL
        row.value = tempArrayFL[0]
        attrString = NSMutableAttributedString(string: "Financial Level", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        //row.value = "Option 4"
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        section.addFormRow(row)
        
        self.form = form
        
    }
    
    
    
}
