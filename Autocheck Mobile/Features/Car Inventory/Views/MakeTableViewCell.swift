//
//  MakeTableViewCell.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 14/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit
import RxSwift

class MakeTableViewCell: UITableViewCell {

    @IBOutlet weak var makesCollectionView: UICollectionView!
    
    fileprivate let disposeBag = DisposeBag()
    
    func configureView(makes: [Make]) {
        makesCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        Observable.just(makes).bind(to: makesCollectionView.rx.items(cellIdentifier: R.reuseIdentifier.makeCollectionViewCell.identifier, cellType: MakeCollectionViewCell.self)) { index, item, cell in
            
            cell.configureView(make: item)
            
            cell.animateViewOnTapGesture {}
            
        }.disposed(by: disposeBag)
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MakeTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: collectionView.height)
    }
    
}
