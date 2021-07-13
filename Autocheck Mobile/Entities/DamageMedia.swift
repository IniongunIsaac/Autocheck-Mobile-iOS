//
//  DamageMedia.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct DamageMedia: Codable, Scopable {
    let inspectionItems: [InspectionItem]
    let name, comment: String
}
