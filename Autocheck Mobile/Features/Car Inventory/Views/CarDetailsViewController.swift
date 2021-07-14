//
//  CarDetailsViewController.swift
//  Autocheck Mobile
//
//  Created by Isaac Iniongun on 13/07/2021.
//  Copyright © 2021 Isaac Iniongun. All rights reserved.
//

import UIKit
import RxSwift
import AttributedStringBuilder

class CarDetailsViewController: BaseViewController {
    
    @IBOutlet weak var backNavImageView: UIImageView!
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carMediaCollectionView: UICollectionView!
    @IBOutlet weak var carPriceLabel: UILabel!
    @IBOutlet weak var carDetailsLabel: UILabel!
    
    var carInventoryViewModel: ICarInventoryViewModel!
    override func getViewModel() -> BaseViewModel { carInventoryViewModel as! BaseViewModel }
    
    var carDetail: CarDetail!
    var carMedia = [CarMedia]()
    
    override func configureViews() {
        hideNavBar()
        setupCarMediaCollectionView()
        showCarDetails()
        backNavImageView.addPopGesture(on: self)
    }
    
    fileprivate func setupCarMediaCollectionView() {
        carMediaCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        Observable.just(carMedia).map({ $0.isEmpty }).distinctUntilChanged().bind(to: carMediaCollectionView.rx.isEmpty(message: "Media will appear here!")).disposed(by: disposeBag)
        Observable.just(carMedia).bind(to: carMediaCollectionView.rx.items(cellIdentifier: R.reuseIdentifier.carMediaCollectionViewCell.identifier, cellType: CarMediaCollectionViewCell.self)) { index, item, cell in
            
            cell.configureView(media: item)
            
            cell.animateViewOnTapGesture { [weak self] in
                self?.carImageView.image = cell.mediaImageView.image
                cell.activate()
                self?.carMediaCollectionView.visibleCells.filter { $0 != cell }.forEach {
                    ($0 as! CarMediaCollectionViewCell).activate(false)
                }
            }
            
        }.disposed(by: disposeBag)
    }
    
    fileprivate func showCarDetails() {
        let labelSize = CGFloat(15)
        let valueSize = CGFloat(16)
        carDetail.do {
            carImageView.setImageFromURL(url: $0.imageURL)
            carNameLabel.text = $0.model.make.name
            
            carDetailsLabel.attributedText = AttributedStringBuilder()
                .text("Selling Price:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.price.currencyFormatted())", attributes: [.font(.nunitoBold(size: 20)), .textColor(.red)])
                .newlines(2)
                .text("Market Price:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.marketplacePrice.currencyFormatted())", attributes: [.font(.nunitoBold(size: 20))])
                .newlines(2)
                .text("Installmental Fee:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.installment.currencyFormatted())", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Year:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.year)", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Rating:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.gradeScore.string())", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Mileage:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.mileage)\($0.mileageUnit.capitalized)", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Wheel Type:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.model.wheelType.uppercased())", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Location:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.address), \($0.city), \($0.state), \($0.country)", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Transmission:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.transmission.capitalized)", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Interior Color:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.interiorColor)", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Exterior Color:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.exteriorColor)", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Engine type:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.engineType.capitalized)", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Condition:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.sellingCondition.capitalized)", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Has Warranty:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.hasWarranty ? "Yes" : "No")", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Has Financing:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.hasFinancing ? "Yes" : "No")", attributes: [.font(.nunitoBold(size: valueSize))])
                .newlines(2)
                .text("Is Insured:   ", attributes: [.font(.nunitoRegular(size: labelSize))])
                .text("\($0.insured ? "Yes" : "No")", attributes: [.font(.nunitoBold(size: valueSize))])
                .attributedString
        }
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CarDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: collectionView.height)
    }
    
}
