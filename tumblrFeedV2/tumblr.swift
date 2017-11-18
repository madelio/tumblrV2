//
//  tumblr.swift
//  tumblrFeedV2
//
//  Created by Madel Asistio on 11/11/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import Foundation

struct tumblr {
    
    func fillDict(with url: String, completion: @escaping (_ posts: [[String: Any]]) -> Void) {
        let url = URL(string: url)!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                //print(dataDictionary)
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                // Store the returned array of dictionaries in our posts property
                let posts = responseDictionary["posts"] as! [[String: Any]]
                completion(posts)
                
            }
        }
        
        task.resume()
        
    }
    
    func getPhoto(from post: [String: Any]) -> URL? {
        if let photos = post["photos"] as? [[String: Any]] {
            // photos is NOT nil, we can use it!
            // TODO: Get the photo url
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
            let urlString = originalSize["url"] as! String
            // 4.
            let url = URL(string: urlString)
            return url
        }
        
        return nil
    }
}
