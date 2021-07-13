//
//  RemoteDataSourceConstants.swift
//  Spottr
//
//  Created by Isaac Iniongun on 04/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation

struct RemoteDataSourceConstants {
    
    struct Endpoints {
        
        fileprivate static let BASE_URL = AppConstants.Keys.BASE_URL
        
        struct Inventory {
            
            fileprivate static let _BASE_URL = "\(BASE_URL)inventory/"
            
            static let MAKES = "\(_BASE_URL)make?popular=true"
            
            static let CAR_SEARCH = "\(_BASE_URL)car/search"
            
            static func CAR_DETAILS(id: String) -> String { "\(_BASE_URL)car/\(id)" }
            
            static let CAR_MEDIA = "\(_BASE_URL)car_media"
            
        }
        
    }
    
}
