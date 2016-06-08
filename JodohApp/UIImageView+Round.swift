//
//  UIImageView+Round.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/30/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit


extension UIImageView {

    func createBorder()->UIImageView {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        return self
    }
    
}
