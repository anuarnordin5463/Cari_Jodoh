//
//  LoadingScreenViewController.swift
//  JodohApp
//
//  Created by Nazri Hussein on 6/3/16.
//  Copyright © 2016 intern. All rights reserved.
//

import UIKit

class LoadingScreenViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var loadingImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loadingGif = UIImage.gifWithName("cj_loading")
        let imageView = UIImageView(image: loadingGif)
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
        bgView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)
        loadingImg.addSubview(imageView)
        
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
