//
//  MakeCollectionViewCell.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 14/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class MakeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var makeImageView: UIImageView!
    @IBOutlet weak var makeLabel: UILabel!
    
    func configureView(make: Make) {
        make.do {
            makeImageView.setImageFromURL(url: $0.imageURL)
            makeLabel.text = $0.name
        }
    }
    
}
