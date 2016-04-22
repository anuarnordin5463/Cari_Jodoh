//
//  ProfileViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    var imgName = String()
    
    @IBOutlet weak var user: UILabel!
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.image = UIImage(named: imgName)
        user.text = userName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
