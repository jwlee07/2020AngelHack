//
//  MainCollectionViewCell.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
  // MARK: - Property
  
  let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemIndigo
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "상품설명"
    label.textColor = .systemGray3
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.shadowColor = .systemGray3
    return label
  }()
  
  let mapLabel: UILabel = {
    let label = UILabel()
    label.text = "성수1동"
    label.textColor = .systemGray3
    label.font = UIFont.boldSystemFont(ofSize: 10)
    return label
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.text = "3시간전"
    label.textColor = .systemGray3
    label.font = UIFont.boldSystemFont(ofSize: 10)
    return label
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.text = "3,000원"
    label.textColor = .systemGray3
    label.font = UIFont.boldSystemFont(ofSize: 15)
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
    
    let padding: CGFloat = 10
    
    contentView.addSubview(productImageView)
    productImageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      productImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -contentView.frame.height / 3)
    ])
    
    [titleLabel, mapLabel, priceLabel].forEach {
      productImageView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
    }
    productImageView.addSubview(timeLabel)
    timeLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: productImageView.safeAreaLayoutGuide.bottomAnchor, constant: padding),
      
      mapLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
      
      timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
      timeLabel.leadingAnchor.constraint(equalTo: mapLabel.safeAreaLayoutGuide.trailingAnchor, constant: padding),
      
      priceLabel.topAnchor.constraint(equalTo: mapLabel.safeAreaLayoutGuide.bottomAnchor, constant: padding),
      priceLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
