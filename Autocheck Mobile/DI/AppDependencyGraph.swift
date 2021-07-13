//
//  AppDependencyGraph.swift
//  Spottr
//
//  Created by Isaac Iniongun on 16/09/2020.
//  Copyright © 2020 Isaac Iniongun. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    public static func setup() {
        
        defaultContainer.register(IPreference.self) { _ in PreferenceImpl() }
        
        defaultContainer.register(IInventoryRemoteDatasource.self) { _ in InventoryRemoteDatasourceImpl() }
        
        defaultContainer.register(ICarInventoryViewModel.self) {
            CarInventoryViewModelImpl(remoteDatasource: $0.resolve(IInventoryRemoteDatasource.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(CarInventoryViewController.self) { res, cntrl in
            cntrl.carInventoryViewModel = res.resolve(ICarInventoryViewModel.self)
        }
        
        defaultContainer.storyboardInitCompleted(CarDetailsViewController.self) { res, cntrl in
            cntrl.carInventoryViewModel = res.resolve(ICarInventoryViewModel.self)
        }
        
    }
    
}
