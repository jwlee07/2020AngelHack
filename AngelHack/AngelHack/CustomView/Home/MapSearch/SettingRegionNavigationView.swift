//
//  SettingRegionNavigationView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/13.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SettingRegionNavigationView: UIView {
  // MARK: - Properties
  private let dismissBtn = UIButton()
  private let naviTitleLabel = UILabel()
  
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
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 24)
    let largeBoldDoc = UIImage(systemName: "multiply", withConfiguration: largeConfig)
    dismissBtn.setImage(largeBoldDoc, for: .normal)
    dismissBtn.tintColor = .systemGray
    
    naviTitleLabel.text = "지역 설정하기"
    naviTitleLabel.font = .boldSystemFont(ofSize: 16)
    naviTitleLabel.textColor = .systemGray
    
    [dismissBtn, naviTitleLabel].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      dismissBtn.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      dismissBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      dismissBtn.widthAnchor.constraint(equalToConstant: 24),
      dismissBtn.heightAnchor.constraint(equalToConstant: 24)
    ])
    
    NSLayoutConstraint.activate([
      naviTitleLabel.centerYAnchor.constraint(equalTo: dismissBtn.centerYAnchor),
      naviTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension

