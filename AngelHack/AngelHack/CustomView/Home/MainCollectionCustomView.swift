//
//  MainCollectionCustomView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MainCollectionCustomView: UIView {
  
  // MARK: - Property
  
  let collectionViewLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
  
  // MARK: - View Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setCollectionView()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setCollectionView() {

    let layoutWidth: CGFloat = DeviceSize.width / 2.15
    let layoutHeight: CGFloat = DeviceSize.height / 3
    let lineSpacing: CGFloat = 10
    let interitemSpacing: CGFloat = 0
    let itemInsets: CGFloat = 0
    
    collectionViewLayout.itemSize = CGSize (width: layoutWidth, height: layoutHeight)
    collectionViewLayout.minimumLineSpacing = lineSpacing
    collectionViewLayout.minimumInteritemSpacing = interitemSpacing
    collectionViewLayout.sectionInset = UIEdgeInsets (top: itemInsets, left: itemInsets, bottom: itemInsets, right: itemInsets)
    
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Custom")
    
  }
  
  func setUI() {
    self.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: self.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
// MARK: - UICollectionViewDataSource

extension MainCollectionCustomView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Custom", for: indexPath) as! MainCollectionViewCell
    cell.backgroundColor = .systemGray
    cell.productImageView.image = UIImage(named: "jwlee_logo")
    return cell
  }
}

