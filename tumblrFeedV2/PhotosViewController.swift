//
//  PhotosViewController.swift
//  tumblrFeedV2
//
//  Created by Madel Asistio on 11/11/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // an array of arrays
    var posts: [[String: Any]] = []
    var tumblrObj = tumblr()
    
    @IBOutlet weak var tableView: UITableView!
 
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        
    tumblrObj.fillDict(with:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV") {
        (result: [[String:Any]]) in
        
            self.posts = result
            self.tableView.reloadData()
        
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let url = tumblrObj.getPhoto(from: posts[indexPath.row])
        
        cell.tumblrImg.af_setImage(withURL: url!)
      
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
