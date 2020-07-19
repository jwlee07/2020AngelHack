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
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCollectionViewCell
    
    cell.productImageView.image = UIImage(named: "못생긴감자_3")
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
