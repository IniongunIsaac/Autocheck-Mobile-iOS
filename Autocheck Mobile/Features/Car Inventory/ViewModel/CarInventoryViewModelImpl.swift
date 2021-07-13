//
//  CarInventoryViewModelImpl.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

class CarInventoryViewModelImpl: BaseViewModel, ICarInventoryViewModel {
    
    fileprivate let remoteDatasource: IInventoryRemoteDatasource
    
    init(remoteDatasource: IInventoryRemoteDatasource) {
        self.remoteDatasource = remoteDatasource
    }
}
