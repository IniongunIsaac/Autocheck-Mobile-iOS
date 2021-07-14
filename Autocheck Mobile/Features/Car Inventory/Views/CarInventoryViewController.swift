//
//  CarInventoryViewController.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class CarInventoryViewController: BaseViewController {
    
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var carsTableView: UITableView!
    
    var carInventoryViewModel: ICarInventoryViewModel!
    override func getViewModel() -> BaseViewModel { carInventoryViewModel as! BaseViewModel }
    override var horizontalProgressBarYPosition: CGFloat { menuImageView.minY - 5 }
    
    fileprivate var cars: [Car] { carInventoryViewModel.cars }
    
    fileprivate lazy var emptyView: EmptyView = {
        EmptyView().apply {
            $0.messageText = "Data not available at the moment!"
            $0.retryTapHandler = { [weak self] in
                self?.carInventoryViewModel.getMakesAndCars()
            }
        }
    }()
    
    override func configureViews() {
        hideNavBar()
        carsTableView.do {
            $0.dataSource = self
            $0.delegate = self
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeShowMakesAndCars()
    }
    
    fileprivate func observeShowMakesAndCars() {
        carInventoryViewModel.showCarsAndMakes.bind { [weak self] show in
            if show {
                self?.showCarsAndMakes()
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func showCarsAndMakes() {
        if cars.isEmpty {
            carsTableView.showView(false)
            view.addSubview(emptyView)
            emptyView.anchor(top: topStackView.bottomAnchor, paddingTop: 20, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 20, left: view.safeAreaLayoutGuide.leftAnchor, paddingLeft: 20, right: view.safeAreaLayoutGuide.rightAnchor, paddingRight: 20)
            emptyView.do {
                if carInventoryViewModel.hasFetchedCarsAndMakes {
                    $0.messageText = "Data not available at the moment!"
                    $0.showRetryIcon = true
                    $0.showEmptyIcon = true
                } else {
                    $0.messageText = "Loading data, please wait..."
                    $0.showRetryIcon = false
                    $0.showEmptyIcon = false
                }
            }
        } else {
            emptyView.removeFromSuperview()
            carsTableView.do {
                $0.showView()
                $0.reloadData()
            }
        }
    }
    
}

extension CarInventoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cars.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        if index == 0 {
            let makesCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.makeTableViewCell.identifier, for: indexPath) as! MakeTableViewCell
            makesCell.configureView(makes: carInventoryViewModel.makes)
            
            return makesCell
            
        } else {
            let carCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.carTableViewCell.identifier, for: indexPath) as! CarTableViewCell
            
            let car = cars[index - 1]
            carCell.configureView(car: car)
            carCell.animateViewOnTapGesture { [weak self] in
                self?.showCarDetailsViewController(car)
            }
            
            return carCell
        }
    }
    
    fileprivate func showCarDetailsViewController(_ car: Car) {
        showAlert(message: "Voilaaaa!", type: .success)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        carInventoryViewModel.do {
            if indexPath.row == cars.count - 2 {
                if $0.canFetchMoreCars {
                    $0.getMoreCars()
                }
            }
        }
    }
    
    
}
