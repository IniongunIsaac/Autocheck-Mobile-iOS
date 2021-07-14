//
//  ICarInventoryViewModel.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import Foundation
import RxSwift

protocol ICarInventoryViewModel: Scopable {
    
    var makes: [Make] { get set }
    
    var cars: [Car] { get set }
    
    var canFetchMoreCars: Bool { get }
    
    var hasFetchedCarsAndMakes: Bool { get set }
    
    var showCarsAndMakes: PublishSubject<Bool> { get }
    
    func getMakesAndCars()
    
    func getMoreCars()
    
}
