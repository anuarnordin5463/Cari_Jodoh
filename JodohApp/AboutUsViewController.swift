//
//  AboutUsViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 6/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import XLForm

class AboutUsViewController: BaseXLFormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuButton()
        self.title = "TENTANG KAMI"
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Roboto-Regular", size: 20.0)!,NSForegroundColorAttributeName: UIColor.whiteColor()];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
