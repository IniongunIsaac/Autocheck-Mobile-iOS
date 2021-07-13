//
//  IInventoryDatasource.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

protocol IInventoryRemoteDatasource {
    
    func getCarBrands() -> Observable<MakeResponse>
    
    func getCars(params: BodyParam) -> Observable<CarResponse>
    
    func getCarDetails(id: String) -> Observable<CarDetail>
    
    func getCarMedia(params: BodyParam) -> Observable<CarMediaResponse>
    
}
