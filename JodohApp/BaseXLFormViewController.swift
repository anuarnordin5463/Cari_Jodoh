//
//  BaseXLFormViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/11/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import XLForm

class BaseXLFormViewController: XLFormViewController {
    
    var isValidate = Bool()
    var user_profile = Dictionary<String,AnyObject>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLeftButton(){
        let tools = UIToolbar()
        tools.frame = CGRectMake(0, 0, 95, 44)
        tools.setBackgroundImage(UIImage(), forToolbarPosition: .Any, barMetrics: .Default)
        tools.backgroundColor = UIColor.clearColor()
        tools.clipsToBounds = true;
        tools.translucent = true;
        
        let image1 = UIImage(named: "MenuIconWhite")! .imageWithRenderingMode(.AlwaysOriginal)
        let image2 = UIImage(named: "back")! .imageWithRenderingMode(.AlwaysOriginal)
        
        let menuButton = UIBarButtonItem(image: image1, style: .Plain, target: self, action: #selector(BaseXLFormViewController.menuTapped(_:)))
        menuButton.imageInsets = UIEdgeInsetsMake(0, -35, 0, 0)
        
        let backButton = UIBarButtonItem(image: image2, style: .Plain, target: self, action: #selector(BaseXLFormViewController.backButtonPressed(_:)))
        backButton.imageInsets = UIEdgeInsetsMake(0, -35, 0, 0)
        
        let buttons:[UIBarButtonItem] = [menuButton, backButton];
        tools.setItems(buttons, animated: false)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: tools)
    }
    
    func menuTapped(sender: UIBarButtonItem){
        self.slideMenuController()?.toggleLeft()
    }
    
    func backButtonPressed(sender: UIBarButtonItem){
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    func validateForm() {
        let array = formValidationErrors()
        
        if array.count != 0 {
            isValidate = false
            for errorItem in array {
                let error = errorItem as! NSError
                let validationStatus : XLFormValidationStatus = error.userInfo[XLValidationStatusErrorKey] as! XLFormValidationStatus
                
                if validationStatus.rowDescriptor!.tag == Tags.ValidationFirstName ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationUsername ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationPassword ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationConfirmPassword ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationName ||
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationCountry ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationTown ||
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationState ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationMobile ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationHeight ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationWeight ||
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationSmokerVapes ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationHighEducation ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationOccupation ||
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationMaritalStatus ||
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationHaveAChildren ||
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationRelationshipStatus ||
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationPolygamy ||
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationFinancialLevel ||
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationDOB ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationKataLaluanLama ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationKataLaluanBaru ||
                    validationStatus.rowDescriptor!.tag == Tags.ValidationSahKataLaluan
                    //validationStatus.rowDescriptor!.tag == Tags.ValidationJantina
                    //validationStatus.rowDescriptor!.tag == Tags2.ValidationEmel ||
                    //validationStatus.rowDescriptor!.tag == Tags2.ValidationKataLaluan ||
                    //validationStatus.rowDescriptor!.tag == Tags2.ValidationSahKataLaluan
                {
                    
                    if let rowDescriptor = validationStatus.rowDescriptor, let indexPath = form.indexPathOfFormRow(rowDescriptor), let cell = tableView.cellForRowAtIndexPath(indexPath) as? XLFormTextFieldCell {
                        let textFieldAttrib = NSAttributedString.init(string: validationStatus.msg, attributes: [NSForegroundColorAttributeName : UIColor.redColor()])
                        //rowDescriptor.cellConfig["textField.textAlignment"] = NSTextAlignment.Right.rawValue
                        cell.textField?.attributedPlaceholder = textFieldAttrib
                        
                    }
                }
            }
            
        }else{
            isValidate = true
            
        }
        
    }
    
}
