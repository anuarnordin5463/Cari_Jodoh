//
//  ViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 4/21/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class ViewController: UIViewController, ENSideMenuDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
    }
    
    @IBAction func toggleSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    @IBOutlet weak var imageView: UICollectionView!

    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["Name: A", "Name: B", "Name: C", "Name: D", "Name: E", "Name: F", "Name: G", "Name: H", "Name: I", "Name: J", "Name: K", "Name: L", "Name: M", "Name: N", "Name: O", "Name: P", "Name: Q", "Name: R"/*, "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", ""*/]
    
    
    // MARK: - UICollectionViewDataSource protocol
    //@IBOutlet weak var myLabel: MyCollectionViewCell!
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
        
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.grayColor() // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(items[indexPath.row])!")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let manageFlightVC = storyboard.instantiateViewControllerWithIdentifier("profileVC") as! ProfileViewController
        manageFlightVC.imgName = "nora"
        manageFlightVC.userName = (items[indexPath.row])
        self.navigationController!.pushViewController(manageFlightVC, animated: true)
        
        
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }


}

