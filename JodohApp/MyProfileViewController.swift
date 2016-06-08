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
    var image: UIImage!
    let myPickerController = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //user_profile = ["user_height" : ""]
        //defaults.setValue("", forKey: "user_height")//simpan data
        //defaults.setValue("", forKey: "user_profile")//simpan data
        //defaults.synchronize()
        
        if (image != nil) {
            userImage.image = image
            
        } else {
            print("image was null")
        }
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MyProfileViewController.refreshSideMenu(_:)), name: "reloadSideMenu", object: nil)
        setupLeftButton()
        //self.setNavigationBarItem()
        initializeForm()
        submitButton.layer.cornerRadius = 5
        //userImage.image = UIImage(named:"homePic")
        //userImage.image = myPickerController.delegate as? UIImage
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
        //Set Color
        //Set Font Size
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Roboto-Regular", size: 20.0)!,NSForegroundColorAttributeName: UIColor.whiteColor()];
        
        // Do any additional setup after loading the view.
    }
    
    func refreshTable(notif:NSNotificationCenter){
        //hideRow = true
        //self.MyProfileTableView.reloadData()
        //defaults.objectForKey("user_height") as! String
        //defaults.synchronize()
        
        //let userInfo = defaults.objectForKey("user_profile") as! NSData
        //let tempdata = NSKeyedUnarchiver.unarchiveObjectWithData(userInfo)
        //print(tempdata)
        //print(tempdata!["user_height"] as! String)
        
        
        //print("lol")
        //self.MyProfileTableView.reloadData()
        
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
        infoView.showInfo("Info", subTitle: "Choose picture using:", closeButtonTitle: "Cancel", colorStyle: 0x82EBFF)
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
            
            /*if formValues()[Tags2.ValidationKataLaluan] == nil{
                return
                //showErrorMessage("Confirm password incorrect")
            }else if formValues()[Tags2.ValidationKataLaluan]! as! String != formValues()[Tags2.ValidationSahKataLaluan]! as! String {
                showErrorMessage("Confirm password incorrect")
            }else{*/
            
            
            let signature = defaults.objectForKey("signature") as! String
            let mobile = formValues()[Tags.ValidationMobile] as! String
            let height = formValues()[Tags.ValidationHeight] as! String
            let weight = formValues()[Tags.ValidationWeight] as! String
            let smoker = (formValues()[Tags.ValidationSmokerVapes] as! XLFormOptionsObject).valueData() as! String
            let state = (formValues()[Tags.ValidationState] as! XLFormOptionsObject).valueData() as! String
            let town = formValues()[Tags.ValidationTown] as! String
            let education = formValues()[Tags.ValidationHighEducation] as! String
            let occupation = formValues()[Tags.ValidationOccupation] as! String
            let DOB = "\(formValues()[Tags.ValidationDOB] as! NSDate)"
            let jantina = (formValues()[Tags.ValidationJantina] as! XLFormOptionsObject).valueData() as! String
            
            showLoading()
            
            JodohAppProvider.request(.Update(DOB,mobile,height,weight,smoker,state,town,education,occupation,signature,jantina), completion: { (result) in
                switch result {
                case .Success(let successResult):
                    do {
                        let json = try JSON(NSJSONSerialization.JSONObjectWithData(successResult.data, options: .MutableContainers))
                        
                        if  json["status"].string == "success"{
                            
                            showInfoSuccessUpdate(json["message"].string!)
                            defaults.setObject(json["auth_token"].string , forKey: "auth_token")//simpan data
                            defaults.synchronize()
                            print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation());
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
            
        //}
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
        //row.required = true
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
        //row.value = "test"
        section.addFormRow(row)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationJantina, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempArrayJantina:[AnyObject] = [AnyObject]()
        tempArrayJantina.append(XLFormOptionsObject(value: "Lelaki", displayText: "Lelaki"))
        tempArrayJantina.append(XLFormOptionsObject(value: "Perempuan", displayText: "Perempuan"))
        row.selectorOptions = tempArrayJantina
        row.value = tempArrayJantina[0]
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Jantina", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationDOB, rowType: XLFormRowDescriptorTypeDate , title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Date of Birth *"
        row.cellConfigAtConfigure["maximumDate"] = NSDate()
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Tarikh Lahir", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.required = true
        row.value = NSDate()
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
        //row.value =
        //contactData["mobile_phone"] as! String
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
        attrString = NSMutableAttributedString(string: "Berat")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        section.addFormRow(row)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationSmokerVapes, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        var tempArraySmoker:[AnyObject] = [AnyObject]()
        tempArraySmoker.append(XLFormOptionsObject(value: "Ya", displayText: "Ya"))
        tempArraySmoker.append(XLFormOptionsObject(value: "Tidak", displayText: "Tidak"))
        row.selectorOptions = tempArraySmoker
        row.value = tempArraySmoker[0]
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Merokok/Vaper", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)
        
        // Basic Information - Section----------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("MAKLUMAT KEDIAMAN")
        form.addFormSection(section)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationState, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //row.selectorOptions = ["Johor","Kedah","Kelantan","Melaka","Negeri Sembilan","Pahang","Perak","Perlis","Pulau Pinang","Sabah","Sarawak","Selangor","Terengganu","Wilayah Persekutuan"]
        //row.value = "Option 4"
        var tempArrayNegara:[AnyObject] = [AnyObject]()
        tempArrayNegara.append(XLFormOptionsObject(value: "Malaysia", displayText: "Malaysia"))//smpai sni,,,lain x buat
        tempArrayNegara.append(XLFormOptionsObject(value: "Lain-lain", displayText: "Lain-lain"))
        row.selectorOptions = tempArrayNegara
        row.value = tempArrayNegara[0]
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Negara", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)
 
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
        attrString = NSMutableAttributedString(string: "Negeri", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
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
        section.addFormRow(row)
        
        // Basic Information - Section--------------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("MAKLUMAT PENDIDIKAN")
        form.addFormSection(section)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationHighEducation, rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "High Education *"
        attrString = NSMutableAttributedString(string: "Pendidikan Tertinggi")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        section.addFormRow(row)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: Tags.ValidationOccupation, rowType: XLFormRowDescriptorTypeName, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "Occupation *"
        attrString = NSMutableAttributedString(string: "Pekerjaan")
        attrString.appendAttributedString(NSAttributedString(string: " *", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        row.required = true
        section.addFormRow(row)
        
        // Basic Information - Section------------------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("STATUS")
        form.addFormSection(section)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationMaritalStatus, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //row.selectorOptions = ["Divorced", "Married", "Single", "Widowed"]
        var tempArrayMarital:[AnyObject] = [AnyObject]()
        tempArrayMarital.append(XLFormOptionsObject(value: "Bercerai", displayText: "Bercerai"))
        tempArrayMarital.append(XLFormOptionsObject(value: "Berkahwin", displayText: "Berkahwin"))
        tempArrayMarital.append(XLFormOptionsObject(value: "Bujang", displayText: "Bujang"))
        tempArrayMarital.append(XLFormOptionsObject(value: "Janda/Duda", displayText: "Janda/Duda"))
        row.selectorOptions = tempArrayMarital
        row.value = tempArrayMarital[0]
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Status Perkahwinan", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        //row.value = "Option 4"
        section.addFormRow(row)
        
        // Smoker/Vapes
        row = XLFormRowDescriptor(tag: Tags.ValidationHaveAChildren, rowType: XLFormRowDescriptorTypeSelectorPickerView , title:"")
        //row.selectorOptions = ["Yes", "No"]
        //row.value = "Option 4"
        var tempArrayChildren:[AnyObject] = [AnyObject]()
        tempArrayChildren.append(XLFormOptionsObject(value: "Tiada", displayText: "Tiada"))
        tempArrayChildren.append(XLFormOptionsObject(value: "1", displayText: "1"))
        tempArrayChildren.append(XLFormOptionsObject(value: "2", displayText: "2"))
        tempArrayChildren.append(XLFormOptionsObject(value: "3", displayText: "3"))
        tempArrayChildren.append(XLFormOptionsObject(value: "4", displayText: "4"))
        tempArrayChildren.append(XLFormOptionsObject(value: "5 dan keatas", displayText: "5 dan keatas"))
        row.selectorOptions = tempArrayChildren
        row.value = tempArrayChildren[0]
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        attrString = NSMutableAttributedString(string: "Bilangan Anak", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        section.addFormRow(row)
        
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
        attrString = NSMutableAttributedString(string: "Status Perhubungan", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        section.addFormRow(row)

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
        attrString = NSMutableAttributedString(string: "Poligami", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        //row.value = "Option 4"
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        section.addFormRow(row)

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
        attrString = NSMutableAttributedString(string: "Kedudukan Kewangan", attributes: text)
        attrText = NSMutableAttributedString(string: " *", attributes: star)
        attrString.appendAttributedString(attrText)
        row.cellConfig["textLabel.attributedText"] = attrString
        //row.value = "Option 4"
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        section.addFormRow(row)
        
        // Basic Information - Section--------------------------
        section = XLFormSectionDescriptor()
        section = XLFormSectionDescriptor.formSectionWithTitle("LANGGANAN")
        form.addFormSection(section)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: "", rowType: XLFormRowDescriptorTypeText, title:"")
        //row.cellConfigAtConfigure["textField.placeholder"] = "High Education *"
        attrString = NSMutableAttributedString(string: "Tiada Pakej")
        attrString.appendAttributedString(NSAttributedString(string: "", attributes: star))
        row.cellConfigAtConfigure["textField.attributedPlaceholder"] = attrString
        row.cellConfigAtConfigure["backgroundColor"] = UIColor(patternImage: UIImage(named: "txtField")!)
        row.cellConfigAtConfigure["textField.textAlignment"] =  NSTextAlignment.Left.rawValue
        //row.required = true
        section.addFormRow(row)

        self.form = form
        
    }
}
