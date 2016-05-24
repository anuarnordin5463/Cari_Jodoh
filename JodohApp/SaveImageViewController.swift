//
//  SaveImageViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 5/23/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit

class SaveImageViewController: UIViewController {
var image: UIImage!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (image != nil) {
            imageView.image = image
            
        } else {
            print("image was null")
        }
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