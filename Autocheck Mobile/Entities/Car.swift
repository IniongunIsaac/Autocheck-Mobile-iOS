//
//  Car.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct Car: Codable, Scopable {
    let id, title: String
    let imageURL: String
    let year: Int
    let city, state: String
    let gradeScore: Double?
    let sellingCondition: String?
    let hasWarranty: Bool
    let marketplacePrice, marketplaceOldPrice: Int
    let hasFinancing: Bool
    let mileage: Int
    let mileageUnit: String
    let installment: Double
    let depositReceived: Bool
    let loanValue: Int
    let websiteURL: String
    let stats: CarStats
    let bodyTypeID: String
    let sold, hasThreeDImage: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case imageURL = "imageUrl"
        case year, city, state, gradeScore, sellingCondition, hasWarranty, marketplacePrice, marketplaceOldPrice, hasFinancing, mileage, mileageUnit, installment, depositReceived, loanValue
        case websiteURL = "websiteUrl"
        case stats
        case bodyTypeID = "bodyTypeId"
        case sold, hasThreeDImage
    }
}
