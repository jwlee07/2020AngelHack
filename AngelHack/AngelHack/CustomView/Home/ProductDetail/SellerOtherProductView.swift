//
//  SellerOtherProductView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/17.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SellerOtherProductView: UIView {
  
  // MARK: - Property
  
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "판매자의 다른 상품"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()
  
  let collectionLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
  
  var productImageArr = ["감자_1", "피망_1", "참외_1", "고추_1"].compactMap {
    UIImage.init(named: $0)
  }
  var productTitle = ["맛있는 햇감자 팝니다", "직접 농사지은 피망", "달고 맛있는 참외", "아삭달콤 고추"]
  var productUnit = ["10kg 25,000원", "5kg 22,900원", "10kg 30,000원", "1kg 10,000원"]
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setCollectionView()
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setCollectionView() {
    
    self.backgroundColor = .systemBackground
    
    let layoutWidth: CGFloat = 150
    let layoutHeight: CGFloat = 190
    let lineSpacing: CGFloat = 10
    let interitemSpacing: CGFloat = 10
    let itemInsets: CGFloat = 10
    
    collectionLayout.itemSize = CGSize (width: layoutWidth, height: layoutHeight)
    collectionLayout.minimumLineSpacing = lineSpacing
    collectionLayout.minimumInteritemSpacing = interitemSpacing
    collectionLayout.sectionInset = UIEdgeInsets (top: itemInsets, left: itemInsets, bottom: itemInsets, right: itemInsets)
    collectionLayout.scrollDirection = .horizontal
    
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.register(SellerOtherProducCollectionViewCell.self, forCellWithReuseIdentifier: "Custom")
    
  }
  
  func setUI() {
    
    let margin: CGFloat = 10
    let minMargin: CGFloat = 5
    
    [titleLabel, collectionView].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
      
      collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: minMargin),
      collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}

// MARK: - UICollectionViewDataSource

extension SellerOtherProductView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return productImageArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Custom", for: indexPath) as! SellerOtherProducCollectionViewCell
    cell.backgroundColor = .systemGray6
    cell.imageView.image = productImageArr[indexPath.row]
    cell.titleLabel.text = productTitle[indexPath.row]
    cell.unitLabel.text = productUnit[indexPath.row]
    cell.layer.cornerRadius = 15
    cell.clipsToBounds = true
    return cell
  }
}
