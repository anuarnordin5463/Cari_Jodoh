//
//  ViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, SlideMenuControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        
        //imgPic.layer.borderWidth = 1
        //imgPic.masksToBounds = false
        //imgPic.layer.borderColor = UIColor.whiteColor().CGColor
        //imgPic.layer.cornerRadius = imgPic.frame.height/2
        //imgPic.clipsToBounds = true

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var imageView: UICollectionView!

    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["Nur Ain, 24", "Siti Anis, 24", "Nur Afiqah, 23", "Siti Nordiana, 24", "Nurhadaina, 24", "Siti Suhaida, 24", "Name: G", "Name: H", "Name: I", "Name: J", "Name: K", "Name: L", "Name: M", "Name: N", "Name: O", "Name: P", "Name: Q", "Name: R"/*, "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", ""*/]
    
    
    // MARK: - UICollectionViewDataSource protocol
    //@IBOutlet weak var myLabel: MyCollectionViewCell!
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
        
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = imageView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.whiteColor() // make cell more visible in our example project
        
        cell.imgPic.layer.borderWidth = 1
        cell.imgPic.layer.masksToBounds = false
        cell.imgPic.layer.borderColor = UIColor.whiteColor().CGColor
        cell.imgPic.layer.cornerRadius = cell.imgPic.frame.height/2
        cell.imgPic.clipsToBounds = true
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(items[indexPath.row])!")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileViewController
        manageFlightVC.imgName = "nora"
        manageFlightVC.userName = (items[indexPath.row])
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
        
        
        
    }
    


}

