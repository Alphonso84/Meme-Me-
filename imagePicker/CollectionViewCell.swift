//
//  CollectionViewCell.swift
//  imagePicker
//
//  Created by user on 10/11/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    
    func setMeme(image: UIImage) {

        myImageView.image = image
    }
    
}
