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
import SwiftyJSON
import SCLAlertView

class MyProfileViewController: BaseXLFormViewController, SlideMenuControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var MyProfileTableView: UITableView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var packageName: UILabel!
    var image: UIImage!
    let myPickerController = UIImagePickerController()
    
    var tempData = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (image != nil) {
            userImage.image = image
            
        } else {
            print("image was null")
        }
        
        setupLeftButton()
        initializeForm()
        submitButton.layer.cornerRadius = 5
        userImage.layer.borderWidth = 1
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.lightGrayColor().CGColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(MyProfileViewController.imageTapped(_:)))
        userImage.userInteractionEnabled = true
        userImage.addGestureRecognizer(tapGestureRecognizer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MyProfileViewController.refreshTable(_:)), name: "reloadTable", object: nil)
        self.title = "KEMASKINI PROFIL"
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Roboto-Regular", size: 20.0)!,NSForegroundColorAttributeName: UIColor.whiteColor()];
        
    }
    
    func refreshTable(notif:NSNotificationCenter){
        let userInfo = defaults.objectForKey("user_profile") as! NSData
        tempData = NSKeyedUnarchiver.unarchiveObjectWithData(userInfo) as! NSDictionary
        //tempData = (NSKeyedUnarchiver.unarchiveObjectWithData(userInfo) as? NSDictionary)!
        initializeForm()
        packageName.text = tempData["user_package"] as? String
        if (tempData["user_image"] as? String) == ""{
            userImage.image = UIImage(named: "personIcon.jpg")
        }else{
            userImage.image = UIImage(named: "emma.jpg")
        }
    }
    
    func imageTapped(img: AnyObject)
    {
        let infoView = SCLAlertView()
        infoView.addButton("Camera") {
            self.camera()
        }
        infoView.addButton("Photo Library") {
            self.photoLibrary()
        }
        infoView.showInfo("Info", subTitle: "Choose picture using:", closeButtonTitle: "Cancel", colorStyle: 0x0679AD)
    }

    
    func photoLibrary()
    {
        
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(myPickerController, animated: true, completion: nil)
        //NSNotificationCenter.defaultCenter().postNotificationName("reloadSideMenu", object: nil)
    }
    
    func camera()
    {
        //myPickerController.delegate = self;
        //myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
        //self.presentViewController(myPickerController, animated: true, completion: nil)
        
            if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
                myPickerController.delegate = self;
                myPickerController.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(myPickerController, animated: true, completion: nil)
            } else {
                self.noCamera()
            }
        }

    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera",message: "Sorry, this device has no camera",preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK",style:.Default,handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC,animated: true,completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let storyboard = UIStoryboard(name: "MyProfile", bundle: nil)
        let saveImageViewController = storyboard.instantiateViewControllerWithIdentifier("MyProfileVC") as! MyProfileViewController
        saveImageViewController.image = image
        self.navigationController!.pushViewController(saveImageViewController, animated: true)
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        
        validateForm()

        if isValidate{
            
            if formValues()[Tags2.ValidationKataLaluan]! as? String != formValues()[Tags2.ValidationSahKataLaluan]! as? String {
                showErrorMessage("Confirm password incorrect")
            }else{
            
            let signature = defaults.objectForKey("signature") as! String
            let name = formValues()[Tags.ValidationName] as! String
            let mobile = formValues()[Tags.ValidationMobile] as! String
            let height = formValues()[Tags.ValidationHeight] as! String
            let weight = formValues()[Tags.ValidationWeight] as! String
            let smoker = (formValues()[Tags.ValidationSmokerVapes] as! XLFormOptionsObject).valueData() as! String
            let country = (formValues()[Tags.ValidationCountry] as! XLFormOptionsObject).valueData() as! String
            let state = (formValues()[Tags.ValidationState] as! XLFormOptionsObject).valueData() as! String
            let town = formValues()[Tags.ValidationTown] as! String
            let education = (formValues()[Tags.ValidationHighEducation] as! XLFormOptionsObject).valueData() as! String
            let occupation = (formValues()[Tags.ValidationOccupation] as! XLFormOptionsObject).valueData() as! String
            let DOB = "\(formValues()[Tags.ValidationDOB] as! NSDate)"
            let jantina = (formValues()[Tags.ValidationJantina] as! XLFormOptionsObject).valueData() as! String
            let marital = (formValues()[Tags.ValidationMaritalStatus] as! XLFormOptionsObject).valueData() as! String
            let children = (formValues()[Tags.ValidationHaveAChildren] as! XLFormOptionsObject).valueData() as! String
            let relationship = (formValues()[Tags.ValidationRelationshipStatus] as! XLFormOptionsObject).valueData() as! String
            let polygamy = (formValues()[Tags.ValidationPolygamy] as! XLFormOptionsObject).valueData() as! String
            let financial = (formValues()[Tags.ValidationFinancialLevel] as! XLFormOptionsObject).valueData() as! String
            
            showLoading()
            
            JodohAppProvider.request(.Update(DOB,mobile,height,weight,smoker,state,town,education,occupation,signature,jantina,name,country,marital,children,relationship,polygamy,financial), completion: { (result) in
                switch result {
                case .Success(let successResult):
                    do {
                        let json = try JSON(NSJSONSerialization.JSONObjectWithData(successResult.data, options: .MutableContainers))
                        
                        if  json["status"].string == "success"{
                            
                            showInfoSuccessUpdate(json["message"].string!)
                            defaults.setObject(json["auth_token"].string , forKey: "auth_token")//simpan data
                            defaults.synchronize()
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
                            self.navigationController!.pushViewController(manageFlightVC, animated: true)
                            
                        }else{
                            showErrorMessage(json["error"].string!)
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
            
        }
        }
        else{
            print("false,value can't be empty")
        }
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
        //let signature = defaults.objectForKey("signature") as! String
        
        form = XLFormDescriptor(title: "") //as XLFormDescriptor
        
        // Basic Information - Section
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("")
        form.addFormSection(section)
        
        row = XLFormRowDescriptor(tag: Tags2.ValidationEmel, rowType: XLFormRowDescriptorTypeEmail, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "E-mail *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Emel")
        attrString.appendAttributedString(NSAttributedString(string: "", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        row.addValidator(XLFormValidator.emailValidator())
        /*if tempData.count != 0{
            row.value = tempData["user_email"] as? String
        }*/
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags2.ValidationKataLaluan, rowType: XLFormRowDescriptorTypePassword, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Kata Laluan")
        attrString.appendAttributedString(NSAttributedString(string: "", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        //row.required = true
        section.addFormRow(row)
        
        row = XLFormRowDescriptor(tag: Tags2.ValidationSahKataLaluan, rowType: XLFormRowDescriptorTypePassword, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Confirm Password *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        attrString = NSMutableAttributedString(string: "Sah Kata Laluan")
        attrString.appendAttributedString(NSAttributedString(string: "", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        //row.required = true
        section.addFormRow(row)
        
        // Basic Information - Section
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("MAKLUMAT PERIBADI")
        form.addFormSection(section)
        
        // First Name/Given Name-------------------
        row = XLFormRowDescriptor(tag: Tags.ValidationName, rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Name *"
        //row.cellConfig.setObject(UIColor.blueColor(), forKey: "backgroundColor")
        //row.cellConfig.setObject(UIColor.greenColor(), forKey: "textField.textColor")
        attrString = NSMutableAttributedString(string: "Nama")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        if tempData.count != 0{
         row.value = tempData["user_name"] as? String
        }
        section.addFormRow(row)
    
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationJantina, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        
        var tempArray:[AnyObject] = [AnyObject]()
        for title in genderArray{
            tempArray.append(XLFormOptionsObject(value: title["gender_code"], displayText: title["gender_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_sex"] as? String == title["gender_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["gender_code"], displayText: title["gender_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempArray
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Jantina", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.required = true
        section.addFormRow(row)
    
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationDOB, rowType: XLFormRowDescriptorTypeDate , title:"")
        row.cellConfigAtConfigure["maximumDate"] = NSDate()
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Tarikh Lahir", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.required = true
        if (tempData.count != 0){
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzzz"
            let date = dateFormatter.dateFromString((tempData["user_dob"]! as? String)!)
            row.value = date
        }
        //row.value = NSDate()
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationMobile, rowType: XLFormRowDescriptorTypePhone, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Mobile *"
        row.required = true
        attrString = NSMutableAttributedString(string: "Telefon Bimbit")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        if tempData["user_mobile"] == nil{
            row.value = ""
        }else {
            row.value = tempData["user_mobile"] as? String
        }
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationHeight, rowType: XLFormRowDescriptorTypePhone, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Height *"
        row.required = true
        attrString = NSMutableAttributedString(string: "Tinggi")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        if tempData.count != 0{
            row.value = tempData["user_height"] as? String
        }
        section.addFormRow(row)

        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationWeight, rowType: XLFormRowDescriptorTypePhone, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Weight *"
        attrString = NSMutableAttributedString(string: "Berat")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        if tempData.count != 0{
            row.value = tempData["user_weight"] as? String
        }
        section.addFormRow(row)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationSmokerVapes, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //var tempArraySmoker:[AnyObject] = [AnyObject]()
        //tempArraySmoker.append(XLFormOptionsObject(value: "Ya", displayText: "Ya"))
        //tempArraySmoker.append(XLFormOptionsObject(value: "Tidak", displayText: "Tidak"))
        //row.selectorOptions = tempArraySmoker
        //row.value = tempArraySmoker[0]
        var tempSmokerArray:[AnyObject] = [AnyObject]()
        for title in smokerArray{
            tempSmokerArray.append(XLFormOptionsObject(value: title["smoker_code"], displayText: title["smoker_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_smoke"] as? String == title["smoker_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["smoker_code"], displayText: title["smoker_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempSmokerArray
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Merokok/Vaper", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.required = true
        section.addFormRow(row)
        
        // Basic Information - Section----------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("MAKLUMAT KEDIAMAN")
        form.addFormSection(section)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationCountry, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempCountryArray:[AnyObject] = [AnyObject]()
        for title in countryArray{
            tempCountryArray.append(XLFormOptionsObject(value: title["country_code"], displayText: title["country_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_country"] as? String == title["country_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["country_code"], displayText: title["country_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempCountryArray
        row.required = true
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Negara", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)
 
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationState, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempStateArray:[AnyObject] = [AnyObject]()
        for title in stateArray{
            tempStateArray.append(XLFormOptionsObject(value: title["state_code"], displayText: title["state_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_state"] as? String == title["state_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["state_code"], displayText: title["state_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempStateArray
        
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Negeri", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.required = true
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationTown, rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Town *"
        attrString = NSMutableAttributedString(string: "Bandar")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        if tempData.count != 0{
            row.value = tempData["user_town"] as? String
        }
        row.required = true
        section.addFormRow(row)
        
        // Basic Information - Section--------------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("MAKLUMAT PENDIDIKAN")
        form.addFormSection(section)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationHighEducation, rowType: XLFormRowDescriptorTypeSelectorPickerView, title:"")
        var tempEducationArray:[AnyObject] = [AnyObject]()
        for title in educationArray{
            tempEducationArray.append(XLFormOptionsObject(value: title["education_code"], displayText: title["education_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_education"] as? String == title["education_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["education_code"], displayText: title["education_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempEducationArray
        row.required = true
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Pendidikan Tertinggi", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)

        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationOccupation, rowType: XLFormRowDescriptorTypeSelectorPickerView, title:"")
        
        var tempOccupationArray:[AnyObject] = [AnyObject]()
        for title in occupationArray{
            tempOccupationArray.append(XLFormOptionsObject(value: title["occupation_code"], displayText: title["occupation_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_occupation"] as? String == title["occupation_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["occupation_code"], displayText: title["occupation_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempOccupationArray
        row.required = true
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Pekerjaan", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)
        
        // Basic Information - Section------------------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("STATUS")
        form.addFormSection(section)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationMaritalStatus, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempMaritalArray:[AnyObject] = [AnyObject]()
        for title in maritalArray{
            tempMaritalArray.append(XLFormOptionsObject(value: title["marital_code"], displayText: title["marital_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_marital"] as? String == title["marital_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["marital_code"], displayText: title["marital_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempMaritalArray
        row.required = true
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Status Perkahwinan", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        //row.value = "Option 4"
        section.addFormRow(row)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationHaveAChildren, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempChildrenArray:[AnyObject] = [AnyObject]()
        for title in childrenArray{
            tempChildrenArray.append(XLFormOptionsObject(value: title["children_code"], displayText: title["children_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_children"] as? String == title["children_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["children_code"], displayText: title["children_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempChildrenArray
        row.required = true
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Bilangan Anak", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationRelationshipStatus, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempRelationshipArray:[AnyObject] = [AnyObject]()
        for title in relationshipArray{
            tempRelationshipArray.append(XLFormOptionsObject(value: title["relationship_code"], displayText: title["relationship_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_relationship"] as? String == title["relationship_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["relationship_code"], displayText: title["relationship_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempRelationshipArray
        row.required = true
        attrString = NSMutableAttributedString(string: "Status Perhubungan", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        section.addFormRow(row)

        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationPolygamy, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempPolygamyArray:[AnyObject] = [AnyObject]()
        for title in polygamyArray{
            tempPolygamyArray.append(XLFormOptionsObject(value: title["polygamy_code"], displayText: title["polygamy_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_polygamy"] as? String == title["polygamy_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["polygamy_code"], displayText: title["polygamy_name"] as! String)
                }
            }
        }
        row.required = true
        row.selectorOptions = tempPolygamyArray
        attrString = NSMutableAttributedString(string: "Poligami", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        //row.value = "Option 4"
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        section.addFormRow(row)

        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationFinancialLevel, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempFinancialArray:[AnyObject] = [AnyObject]()
        for title in financialArray{
            tempFinancialArray.append(XLFormOptionsObject(value: title["financial_code"], displayText: title["financial_name"] as! String))
            
            if tempData.count != 0{
                
                if tempData["user_financial"] as? String == title["financial_code"] as? String{
                    row.value = XLFormOptionsObject(value: title["financial_code"], displayText: title["financial_name"] as! String)
                }
            }
        }
        row.selectorOptions = tempFinancialArray
        attrString = NSMutableAttributedString(string: "Kedudukan Kewangan", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.required = true
        section.addFormRow(row)
        
        // Basic Information - Section--------------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("LANGGANAN")
        form.addFormSection(section)
        
        self.form = form
        
    }
}
