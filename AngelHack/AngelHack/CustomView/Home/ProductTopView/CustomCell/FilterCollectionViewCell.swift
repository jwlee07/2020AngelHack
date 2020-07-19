//
//  FilterCollectionViewCell.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/17.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
  // MARK: - Properties
  let filterBtn = UIButton()
  
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
    contentView.backgroundColor = .white
    addSubview(filterBtn)
    filterBtn.translatesAutoresizingMaskIntoConstraints = false
    filterBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    filterBtn.setTitleColor(UIColor(red: 0.619, green: 0.619, blue: 0.619, alpha: 1), for: .normal)
    filterBtn.layer.cornerRadius = 11
    filterBtn.layer.borderColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1).cgColor
    filterBtn.clipsToBounds = true
    filterBtn.layer.borderWidth = 1
    filterBtn.layer.borderColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1).cgColor
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      filterBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
      filterBtn.leadingAnchor.constraint(equalTo: leadingAnchor),
      filterBtn.trailingAnchor.constraint(equalTo: trailingAnchor),
      filterBtn.heightAnchor.constraint(equalToConstant: 24)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension



