//
//  ProfileViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift


class ProfileDetailViewController: BaseViewController, SlideMenuControllerDelegate {
    
    @IBOutlet weak var registerButtonPressed: UIButton!
    @IBOutlet weak var loginButtonPressed: UIButton!
        //var lblName = String()
    

    @IBOutlet weak var profileImageView: UIImageView!
    var imgName = UIImage()

    @IBOutlet weak var userLbl: UILabel!
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLeftButton()

        profileImageView.image = imgName
        //user.text = userName
        self.title = userName
        profileImageView.createBorder()
    
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
