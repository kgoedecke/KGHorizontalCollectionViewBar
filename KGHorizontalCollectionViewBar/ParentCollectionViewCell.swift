//
//  ParentCollectionViewCell.swift
//  KGHorizontalCollectionViewBar
//
//  Created by Kevin Goedecke on 11/18/15.
//  Copyright © 2015 kevingoedecke. All rights reserved.
//

import UIKit

class ParentCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ThumbnailImage: UIImageView!
    
    func setThumbnail(thumbnail: UIImage) {
        self.ThumbnailImage.image = thumbnail
        self.ThumbnailImage.layer.cornerRadius = self.ThumbnailImage.frame.size.width/2
        self.ThumbnailImage.clipsToBounds = true;
    }
    
}
