//
//  DangerousContentView.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/18.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DangerousContentView: UIView {
  // MARK: - Properties
  private let layout = UICollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  var superViewWidth: CGFloat = 0
  
  let agriculturalImageListImageArr = ["못생긴감자_1", "감자_1", "못생긴감자_3", "감자_4"].compactMap {
    UIImage.init(named: $0)
  }
  let agriculturalTitleListTitleArr = ["A급 맛 자랑하는 감자", "맛만 있으면 되지예 !", "감자 먹으러 감자 !!", "에헤라디야 감자분다 !"]
  
  let agriculturalUnitListUnitArr = ["5kg 10개", "3kg 50개", "10kg 5개", "7kg 8개"]
  let agriculturalDeadLineListDeadLineArr = ["2020.07.15", "2020.07.19", "2020.07.28", "2020.07.30"]
  
    let agriculturalPriceListPriceArr = ["15,000원", "7,000원", "18,000원", "10,000원"]
  

  // MARK: - View LifeCycle
  init(frame: CGRect, superViewWidth: CGFloat) {
    super.init(frame: frame)
    
    self.superViewWidth = superViewWidth
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Layout
  private func setUI() {
    backgroundColor = .systemBackground
    collectionView.backgroundColor = .systemBackground
    addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension

extension DangerousContentView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return agriculturalImageListImageArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCollectionViewCell
    
    cell.productImageView.image = agriculturalImageListImageArr[indexPath.row]
    cell.titleLabel.text = agriculturalTitleListTitleArr[indexPath.row]
    cell.unitLabel.text = agriculturalUnitListUnitArr[indexPath.row]
    cell.lastDayLabel.text = agriculturalDeadLineListDeadLineArr[indexPath.row]
    cell.priceLabel.text = agriculturalPriceListPriceArr[indexPath.row]
    
    cell.layer.borderWidth = 0.05
    cell.layer.borderColor = UIColor.black.cgColor
    cell.layer.cornerRadius = 10
    
    return cell
  }
}

extension DangerousContentView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 24, left: 10, bottom: 10, right: 10)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSpasing: CGFloat = 8
    let itemCount: CGFloat = 2
    let inset = UIEdgeInsets(top: 24, left: 10, bottom: 10, right: 10)
    
    let contentWidth = superViewWidth - (itemSpasing * (itemCount - 1)) - (inset.left + inset.right)
    let cellWidth = contentWidth / itemCount
    return CGSize(width: cellWidth, height: 330)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    
    return 8
  }
}
