//
//  InspectionItem.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct InspectionItem: Codable, Scopable {
    let medias: [CarMedia]
    let name: String
    let response: String
    let comment, condition: String?
}
