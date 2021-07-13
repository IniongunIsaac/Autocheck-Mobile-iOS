//
//  CarModel.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct CarModel: Codable, Scopable {
    let modelFeatures: [AnyStruct]
    let id: Int
    let name, wheelType: String
    let make: CarBodyType
    let popular: Bool
}
