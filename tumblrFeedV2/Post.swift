//
//  Post.swift
//  tumblrFeedV2
//
//  Created by Madel Asistio on 11/18/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import Foundation

struct Post {
    var photoURL: URL?
    var date: String?
    
    init(_ url: URL?, _ date: String?) {
        self.photoURL = url
        self.date = date
    }
    
    
}
