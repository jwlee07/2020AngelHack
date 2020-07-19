//
//  TalkBottomView.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TalkBottomView: UIView {
  // MARK: - Properties
  private let galleryBtn = UIButton()
  private let textField = UITextField()
  private let textFieldBtn = UIButton()
  
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
    [galleryBtn, textField, textFieldBtn].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    backgroundColor = .systemBackground
    
    galleryBtn.setImage(UIImage(named: "plus"), for: .normal)
    
    textField.layer.borderWidth = 2
    textField.layer.cornerRadius = 6
    textField.layer.borderColor = UIColor(red: 0.871, green: 0.871, blue: 0.871, alpha: 1).cgColor
    
    textFieldBtn.setImage(UIImage(named: "Group"), for: .normal)
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      galleryBtn.topAnchor.constraint(equalTo: topAnchor, constant: 32),
      galleryBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      galleryBtn.widthAnchor.constraint(equalToConstant: 24),
      galleryBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
      
      textField.topAnchor.constraint(equalTo: topAnchor, constant: 24),
      textField.leadingAnchor.constraint(equalTo: galleryBtn.trailingAnchor, constant: 8),
      textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
      
      textFieldBtn.topAnchor.constraint(equalTo: topAnchor, constant: 24),
      textFieldBtn.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -3),
      textFieldBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
      textFieldBtn.widthAnchor.constraint(equalToConstant: 40),
      textFieldBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension
