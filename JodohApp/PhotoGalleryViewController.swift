//
//  PhotoGalleryViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 6/28/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit

class PhotoGalleryViewController: BaseViewController {

    var fromWhere = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setNavigationBarItem()
        if fromWhere == "Side"{
            self.setNavigationBarItem()
        }else{
            setupLeftButton()
        }
        //setupLeftButton()
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
