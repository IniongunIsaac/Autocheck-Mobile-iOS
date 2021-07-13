//
//  CarDetail.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct CarDetail: Codable, Scopable {
    let features, carFeatures, modelFeatures: [AnyStruct]
    let damageMedia: [DamageMedia]
    let id: String
    let year: Int
    let insured: Bool
    let mileage: Int
    let vin, licensePlate, engineNumber: String
    let price: Int
    let createdBy: String
    let marketplacePrice: Int
    let marketplaceVisible: Bool
    let marketplaceVisibleDate: String
    let isFeatured: Bool
    let reasonForSelling: String
    let imageURL: String
    let ownerID: String
    let model: CarModel
    let state, country, address, carManagerID: String
    let ownerType, transmission, fuelType, sellingCondition: String
    let bodyType: CarBodyType
    let city: String
    let marketplaceOldPrice: Int
    let createdAt, updatedAt, mileageUnit: String
    let hasWarranty, hasFinancing: Bool
    let interiorColor, exteriorColor, engineType: String
    let gradeScore: Double
    let installment: Int
    let depositReceived, isFirstOwner: Bool
    let firstOwnerName, firstOwnerPhone: String
    let loanValue: Int
    let websiteURL: String
    let sold, hasThreeDImage: Bool
    
    enum CodingKeys: String, CodingKey {
        case features, carFeatures, modelFeatures, damageMedia, id, year, insured, mileage, vin, licensePlate, engineNumber, price, createdBy, marketplacePrice, marketplaceVisible, marketplaceVisibleDate, isFeatured, reasonForSelling
        case imageURL = "imageUrl"
        case ownerID = "ownerId"
        case model, state, country, address
        case carManagerID = "carManagerId"
        case ownerType, transmission, fuelType, sellingCondition, bodyType, city, marketplaceOldPrice, createdAt, updatedAt, mileageUnit, hasWarranty, hasFinancing, interiorColor, exteriorColor, engineType, gradeScore, installment, depositReceived, isFirstOwner, firstOwnerName, firstOwnerPhone, loanValue
        case websiteURL = "websiteUrl"
        case sold, hasThreeDImage
    }
}
