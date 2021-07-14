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
    
    var makes: [Make] = []
    var cars: [Car] = []
    var canFetchMoreCars: Bool { currentPage < totalPages }
    var hasFetchedCarsAndMakes = false
    var showCarsAndMakes: PublishSubject<Bool> = PublishSubject()
    var showCarDetails: PublishSubject<Bool> = PublishSubject()
    var carDetails: CarDetail? = nil
    var carMedia: [CarMedia] = []
    
    fileprivate var currentPage = 1
    fileprivate var totalCars = 0
    fileprivate var pageSize = 10
    fileprivate var totalPages: Int { totalCars / pageSize }
    fileprivate var carParams: BodyParam {
        [
            "page_number": currentPage,
            "page_size": pageSize
        ]
    }
    
    fileprivate let remoteDatasource: IInventoryRemoteDatasource
    
    init(remoteDatasource: IInventoryRemoteDatasource) {
        self.remoteDatasource = remoteDatasource
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        //getMakesAndCars()
    }
    
    func getMakesAndCars() {
        subscribeAny(Observable.zip(remoteDatasource.getCarBrands(), remoteDatasource.getCars(params: carParams)), success: { [weak self] makesRes, carsRes in
            self?.hasFetchedCarsAndMakes = true
            
            let makes = makesRes.makeList
            let cars = carsRes.cars
            
            if makes.isNotEmpty && cars.isNotEmpty {
                self?.makes = makes
                self?.cars = cars
                self?.totalCars = carsRes.pagination.total
                self?.showCarsAndMakes.onNext(true)
            } else {
                self?.showCarsAndMakes.onNext(false)
            }
            
        })
    }
    
    func getMoreCars() {
        currentPage += 1
        if canFetchMoreCars {
            subscribeAny(remoteDatasource.getCars(params: carParams), success: { [weak self] carsRes in
                self?.cars += carsRes.cars
                self?.showCarsAndMakes.onNext(true)
            })
        }
    }
    
    func getCarDetails(id: String) {
        subscribeAny(Observable.zip(remoteDatasource.getCarDetails(id: id), remoteDatasource.getCarMedia(params: ["carId": id])), errorMessage: "Unable to get car details, please try again!", success: { [weak self] details, mediaRes in
            self?.carDetails = details
            self?.carMedia = mediaRes.carMediaList
            self?.showCarDetails.onNext(true)
        })
    }
    
}
