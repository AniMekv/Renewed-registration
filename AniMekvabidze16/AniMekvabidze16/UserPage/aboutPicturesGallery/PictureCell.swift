//
//  ImageCell.swift
//  AniMekvabidze16
//
//  Created by Mac User on 5/20/21.
//

import UIKit

class PictureCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImageView: UIImageView!

    
    func fullScreen(imageName: String) {
        galleryImageView.image = UIImage(named: imageName)
        
    }
    
}


