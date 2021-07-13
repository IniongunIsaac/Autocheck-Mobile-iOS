//
//  CarResponse.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct CarResponse: Codable {
    let cars: [Car]
    let pagination: Pagination
    
    enum CodingKeys: String, CodingKey {
        case cars = "result", pagination
    }
}
