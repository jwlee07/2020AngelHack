//
//  SellerOtherProducCollectionViewCell.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/17.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SellerOtherProducCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Property
  
  let imageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 12)
    return label
  }()
  
  let unitLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 10)
    return label
  }()
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setUI() {
    
    
    let margin: CGFloat = 8
    let unitMargin: CGFloat = 3
    let contentHeight = contentView.frame.height
    
    [imageView, titleLabel, unitLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -contentHeight / 4),
      
      titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: margin),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      
      unitLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: unitMargin),
      unitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      unitLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
    ])
  }
}
