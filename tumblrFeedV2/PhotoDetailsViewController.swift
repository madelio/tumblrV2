//
//  PhotoDetailsViewController.swift
//  tumblrFeedV2
//
//  Created by Madel Asistio on 11/18/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
   
    var photoURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if photoURL != nil {
            imageView.af_setImage(withURL: photoURL!)
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func zoomPhot(_ sender: UITapGestureRecognizer) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! FullPhotoViewController
        vc.photoURL = self.photoURL
        
    }
    

}
