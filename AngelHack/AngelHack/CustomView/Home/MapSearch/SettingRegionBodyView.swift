//
//  SettingRegionBodyView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/13.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SettingRegionBodyView: UIView {
  // MARK: - Properties
  private let commentTitleLabel = UILabel()
  private let searchTextField = UITextField()
  private let settingRegionBtn = UIButton(type: .system)
  private let textFieldInImageView = TextFieldInImageView()
  
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
    [commentTitleLabel, searchTextField, settingRegionBtn].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    commentTitleLabel.text = "지역을 설정해 주세요."
    commentTitleLabel.textColor = .systemGray
    commentTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .left
    
    searchTextField.attributedPlaceholder = NSAttributedString(
      string: "동 / 도로명주소로 검색하기 (ex. 성수1동)",
      attributes: [
        .foregroundColor: UIColor.lightGray,
        .font: UIFont.boldSystemFont(ofSize: 14.0),
        NSAttributedString.Key.paragraphStyle: paragraphStyle
      ])
    searchTextField.backgroundColor = .systemGray5
    searchTextField.backgroundColor?.withAlphaComponent(0.5)
    searchTextField.leftView = textFieldInImageView
    searchTextField.leftViewMode = .always
    
    settingRegionBtn.setTitle("현 위치로 지역 설정", for: .normal)
    settingRegionBtn.setTitleColor(.systemGray, for: .normal)
    settingRegionBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    settingRegionBtn.backgroundColor = .systemGray3
    settingRegionBtn.addTarget(self, action: #selector(settingRegionDidTap), for: .touchUpInside)
  }
  
  private func setLayout() {
    [commentTitleLabel, searchTextField, settingRegionBtn].forEach {
      NSLayoutConstraint.activate([
        $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 28)
      ])
    }
    
    [searchTextField, settingRegionBtn].forEach {
      NSLayoutConstraint.activate([
        $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -28),
        $0.heightAnchor.constraint(equalToConstant: 38)
      ])
    }
    
    NSLayoutConstraint.activate([
      commentTitleLabel.topAnchor.constraint(equalTo: topAnchor),
    ])
    
    NSLayoutConstraint.activate([
      searchTextField.topAnchor.constraint(equalTo: commentTitleLabel.bottomAnchor, constant: 52)
    ])
    
    NSLayoutConstraint.activate([
      settingRegionBtn.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 16)
    ])
  }
  
  // MARK: - Action Handler
  @objc private func settingRegionDidTap(_ sender: UIButton) {
    print("settingRegionDidTap")
  }
}

// MARK: - Extension


