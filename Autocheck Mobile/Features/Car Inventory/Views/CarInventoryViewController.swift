//
//  CarInventoryViewController.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit

class CarInventoryViewController: BaseViewController {
    
    var carInventoryViewModel: ICarInventoryViewModel!
    override func getViewModel() -> BaseViewModel { carInventoryViewModel as! BaseViewModel }
    
    override func configureViews() {
        
    }
    
}
