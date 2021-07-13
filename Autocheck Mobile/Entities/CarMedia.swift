//
//  CarMedia.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct CarMedia: Codable, Scopable {
    let url, mediaType, name, createdAt, type: String?
    let id: Int?
}
