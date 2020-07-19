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
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Title"
    label.font = UIFont.init(name: "AppleSDGothicNeo-SemiBold", size: 18)
    label.textColor = UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)
    return label
  }()
  
  let unitLabel: UILabel = {
    let label = UILabel()
    label.text = "\(5)kg"
    label.font = UIFont.init(name: "AppleSDGothicNeo-SemiBold", size: 12)
    label.textColor = UIColor(red: 0.619, green: 0.619, blue: 0.619, alpha: 1)
    return label
  }()
  
  let countLabel: UILabel = {
    let label = UILabel()
    label.text = "\(10)개"
    label.font = UIFont.init(name: "AppleSDGothicNeo-SemiBold", size: 12)
    label.textColor = UIColor(red: 0.619, green: 0.619, blue: 0.619, alpha: 1)
    return label
  }()
  
  let lastDayLabel: UILabel = {
    let label = UILabel()
    label.text = "마감일"
    label.font = UIFont.init(name: "AppleSDGothicNeo-SemiBold", size: 11)
    label.textColor = UIColor(red: 0.619, green: 0.619, blue: 0.619, alpha: 1)
    return label
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.text = "3,000원"
    label.font = UIFont.init(name: "AppleSDGothicNeo-SemiBold", size: 18)
    label.textColor = UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1)
    return label
  }()
  
  let likeImageView: UIImageView = {
    let imageView = UIImageView()
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 12)
    imageView.image = UIImage(systemName: "suit.heart", withConfiguration: largeConfig)
    imageView.tintColor = UIColor(red: 0.619, green: 0.619, blue: 0.619, alpha: 1)
    return imageView
  }()
  
  let likeCountLabel: UILabel = {
    let label = UILabel()
    label.text = "\(0)개"
    label.font = UIFont.init(name: "AppleSDGothicNeo-SemiBold", size: 12)
    label.textColor = UIColor(red: 0.619, green: 0.619, blue: 0.619, alpha: 1)
    return label
  }()
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  private func setUI() {
    backgroundColor = .systemBackground
    [
      productImageView,
      titleLabel,
      unitLabel,
      countLabel,
      lastDayLabel,
      priceLabel,
      likeImageView,
      likeCountLabel
      ].forEach {
        contentView.addSubview($0)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      productImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.65),
      
      titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.12),
      
      unitLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
      unitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.12),
      
      countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
      countLabel.leadingAnchor.constraint(equalTo: unitLabel.trailingAnchor, constant: 8),
      
      lastDayLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
      lastDayLabel.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 8),
      
      priceLabel.topAnchor.constraint(equalTo: unitLabel.bottomAnchor, constant: 10),
      priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.12),
      
      likeCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
      likeCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
      
      likeImageView.trailingAnchor.constraint(equalTo: likeCountLabel.leadingAnchor, constant: -4.05),
      likeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
    ])
  }
}
