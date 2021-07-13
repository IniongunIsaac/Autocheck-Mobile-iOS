//
//  CarStats.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation

struct CarStats: Codable, Scopable {
    let webViewCount, webViewerCount, interestCount, testDriveCount: Int
    let appViewCount, appViewerCount, processedLoanCount: Int
}
