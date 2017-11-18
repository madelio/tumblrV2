//
//  PhotoCell.swift
//  tumblrFeedV2
//
//  Created by Madel Asistio on 11/11/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
  
    @IBOutlet weak var tumblrImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
