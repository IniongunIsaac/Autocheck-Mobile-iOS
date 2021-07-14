//
//  CarMediaCollectionViewCell.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 14/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class CarMediaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var mediaImageView: UIImageView!
    
    func configureView(media: CarMedia) {
        if let mediaURL = media.url {
            mediaImageView.setImageFromURL(url: mediaURL)
        }
    }
    
    func activate(_ activate: Bool = true) {
        detailsView.borderWidth = activate ? 2 : 1
        detailsView.borderColor = activate ? .accentColor : .primaryColor
    }
    
}
