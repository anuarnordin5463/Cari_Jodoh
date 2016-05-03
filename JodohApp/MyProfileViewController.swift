//
//  MyProfileViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/28/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import XLForm

class MyProfileViewController: XLFormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeForm()
        //continueBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeForm() {
        
        let form : XLFormDescriptor
        var section : XLFormSectionDescriptor
        var row : XLFormRowDescriptor
        
        form = XLFormDescriptor(title: "")
        
        // Basic Information - Section
        section = XLFormSectionDescriptor()
        form.addFormSection(section)
        
        // First Name/Given Name
        row = XLFormRowDescriptor(tag: "Name", rowType: XLFormRowDescriptorTypeName, title:"")
        row.cellConfigAtConfigure["textField.placeholder"] = "First Name"
        row.required = true
        section.addFormRow(row)
        
        self.form = form
        
    }

    

}
