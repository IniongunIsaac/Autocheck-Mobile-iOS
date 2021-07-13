//
//  InventoryDatasourceImpl.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class InventoryRemoteDatasourceImpl: BaseRemoteDataSourceImpl, IInventoryRemoteDatasource {
    
    func getCarBrands() -> Observable<MakeResponse> {
        makeAPIRequest(responseType: MakeResponse.self, url: RemoteDataSourceConstants.Endpoints.Inventory.MAKES)
    }
    
    func getCars(params: BodyParam) -> Observable<CarResponse> {
        makeAPIRequest(responseType: CarResponse.self, url: RemoteDataSourceConstants.Endpoints.Inventory.CAR_SEARCH, params: params, encoding: URLEncoding.default)
    }
    
    func getCarDetails(id: String) -> Observable<CarDetail> {
        makeAPIRequest(responseType: CarDetail.self, url: RemoteDataSourceConstants.Endpoints.Inventory.CAR_DETAILS(id: id))
    }
    
    func getCarMedia(params: BodyParam) -> Observable<CarMediaResponse> {
        makeAPIRequest(responseType: CarMediaResponse.self, url: RemoteDataSourceConstants.Endpoints.Inventory.CAR_MEDIA, params: params, encoding: URLEncoding.default)
    }
    
}
