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
  var superViewWidth: CGFloat = 0
  var superViewHeight: CGFloat = 0
  
  // MARK: - View Init
  init(frame: CGRect, superViewWidth: CGFloat, superViewHeight: CGFloat) {
    super.init(frame: frame)
    self.superViewWidth = superViewWidth
    self.superViewHeight = superViewHeight
    
    setUI()
    setCollectionView()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setCollectionView() {
    let itemSpasing: CGFloat = 11
    let lineSpasing: CGFloat = 16
    let itemCount:CGFloat = 2
    let sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
    
    collectionViewLayout.sectionInset = sectionInset
    collectionViewLayout.minimumLineSpacing = lineSpasing
    collectionViewLayout.minimumInteritemSpacing = itemSpasing
    print(collectionView.bounds.width)
    let contentWidth = superViewWidth - (itemSpasing * (itemCount - 1)) - (sectionInset.left + sectionInset.right)
    let cellWidth = contentWidth / itemCount
    collectionViewLayout.itemSize = CGSize(width: cellWidth, height: 370)
    
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
    cell.layer.cornerRadius = 10
    cell.clipsToBounds = true
    cell.productImageView.image = UIImage(named: "감자")
    return cell
  }
}


