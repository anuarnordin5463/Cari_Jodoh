//
//  PackageViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 6/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit

class PackageViewController: BaseViewController {

    @IBOutlet weak var pakej1: UIImageView!
    @IBOutlet weak var pakej2: UIImageView!
    @IBOutlet weak var pakej3: UIImageView!
    @IBOutlet weak var pakej4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setNavigationBarItem()
        setupLeftButton()
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(PackageViewController.imageTapped(_:)))
        pakej1.userInteractionEnabled = true
        pakej1.addGestureRecognizer(tapGestureRecognizer)
        let tapGestureRecognizer2 = UITapGestureRecognizer(target:self, action:#selector(PackageViewController.imageTapped(_:)))
        pakej2.userInteractionEnabled = true
        pakej2.addGestureRecognizer(tapGestureRecognizer2)
        let tapGestureRecognizer3 = UITapGestureRecognizer(target:self, action:#selector(PackageViewController.imageTapped(_:)))
        pakej3.userInteractionEnabled = true
        pakej3.addGestureRecognizer(tapGestureRecognizer3)
        let tapGestureRecognizer4 = UITapGestureRecognizer(target:self, action:#selector(PackageViewController.imageTapped(_:)))
        pakej4.userInteractionEnabled = true
        pakej4.addGestureRecognizer(tapGestureRecognizer4)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageTapped(img: AnyObject)
    {
        let storyboard = UIStoryboard(name: "Package", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("PackageListVC") as! PackageListViewController
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
    }
}
