//
//  CategorySelecterListCell.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CategorySelecterListCell: UICollectionViewCell {
  // MARK: - Properties
  let titleImageView = UIImageView()
  let titleLabel = UILabel()
  
  // MARK: - View LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Layout
  private func setUI() {
    [titleImageView, titleLabel].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    titleImageView.contentMode = .scaleToFill
    
    titleLabel.textColor = UIColor(red: 0.278, green: 0.278, blue: 0.278, alpha: 1)
    titleLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 11)
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      titleImageView.topAnchor.constraint(equalTo: topAnchor),
      titleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension

