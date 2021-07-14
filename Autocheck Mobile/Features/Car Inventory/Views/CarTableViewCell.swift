//
//  CarTableViewCell.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 14/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var carImageView: UIImageView!
    
    func configureView(car: Car) {
        car.do {
            nameLabel.text = $0.title
            yearLabel.text = $0.year.string
            priceLabel.text = $0.marketplacePrice.currencyFormatted()
            carImageView.setImageFromURL(url: $0.imageURL)
        }
    }
    
}
