//
//  CustomNavigationBarView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/13.
//  Copyright © 2020 jwlee. All rights reserved.
//


import UIKit

protocol CheckMainButtonDelegate {
  func checkBool(check: Bool)
}

class CustomNavigationBarView: UIView {
  // MARK: - Properties
  // view로 감싸기 height 22 ++
  let areaBtn = UIButton()
  private let areaImage = UIImageView()
  private let searchTextField = UITextField()
  private let searchTextFieldInImageView = TextFieldInImageView()
  private let refreshBtn = UIButton()
  private let foodBtn = UIButton(type: .system)
  private let personBtn = UIButton(type: .system)
  private let animationView = UIView()
  
  private var animationViewleading: NSLayoutConstraint?
  private var areaBtnHeight: NSLayoutConstraint?
  
  var delegate: CheckMainButtonDelegate?
  
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
    
    [areaImage, searchTextField, refreshBtn, foodBtn, personBtn, animationView, areaBtn].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    areaBtn.layer.cornerRadius = 16
    areaBtn.setTitle("성수1동", for: .normal)
    areaBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    areaBtn.setTitleColor(.systemGray, for: .normal)
    areaBtn.layer.borderColor = UIColor.systemGray.cgColor
    areaBtn.layer.borderWidth = 1
    areaBtn.clipsToBounds = true
//    areaBtn.addTarget(self, action: #selector(areaDidTap), for: .touchUpInside)
    
    areaImage.image = UIImage(systemName: "chevron.down")
    areaImage.tintColor = .systemGray
    
    searchTextField.placeholder = "검색..."
    searchTextField.backgroundColor = .systemGray5
    searchTextField.backgroundColor?.withAlphaComponent(0.5)
    searchTextField.layer.cornerRadius = 12
    searchTextField.leftView = searchTextFieldInImageView
    searchTextField.leftViewMode = .always
    
    refreshBtn.setTitle("re", for: .normal)
    refreshBtn.backgroundColor = .systemGray2
    refreshBtn.addTarget(self, action: #selector(refreshDidTap), for: .touchUpInside)
    
    foodBtn.setTitle("food", for: .normal)
    foodBtn.setTitleColor(.systemOrange, for: .normal)
    foodBtn.backgroundColor = .systemGray3
    foodBtn.addTarget(self, action: #selector(foodAndPersonDidTap), for: .touchUpInside)
    
    personBtn.setTitle("person", for: .normal)
    personBtn.setTitleColor(.systemGray, for: .normal)
    personBtn.backgroundColor = .systemGray5
    personBtn.addTarget(self, action: #selector(foodAndPersonDidTap), for: .touchUpInside)
    
    animationView.backgroundColor = .systemOrange
    animationView.layer.cornerRadius = 5
    animationView.clipsToBounds = true
  }
  
  private func setLayout() {
    [searchTextField, foodBtn].forEach {
      $0.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      areaBtn.topAnchor.constraint(equalTo: topAnchor, constant: 12),
      areaBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 118),
      areaBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -118)
    ])
    areaBtnHeight = areaBtn.heightAnchor.constraint(equalToConstant: 34)
    areaBtnHeight?.isActive = true
    
    NSLayoutConstraint.activate([
      areaImage.widthAnchor.constraint(equalToConstant: 15),
      areaImage.centerYAnchor.constraint(equalTo: areaBtn.centerYAnchor),
      areaImage.trailingAnchor.constraint(equalTo: areaBtn.trailingAnchor, constant: -6)
    ])
    
    NSLayoutConstraint.activate([
      searchTextField.topAnchor.constraint(equalTo: areaBtn.bottomAnchor, constant: 8),
      searchTextField.trailingAnchor.constraint(equalTo: refreshBtn.leadingAnchor, constant: -11),
      searchTextField.heightAnchor.constraint(equalToConstant: 38)
    ])
    
    NSLayoutConstraint.activate([
      refreshBtn.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
      refreshBtn.widthAnchor.constraint(equalToConstant: 24),
      refreshBtn.heightAnchor.constraint(equalToConstant: 24),
      refreshBtn.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
    
    NSLayoutConstraint.activate([
      foodBtn.topAnchor.constraint(equalTo: refreshBtn.bottomAnchor, constant: 16),
      foodBtn.heightAnchor.constraint(equalToConstant: 32),
      foodBtn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
    ])
    
    NSLayoutConstraint.activate([
      personBtn.topAnchor.constraint(equalTo: refreshBtn.bottomAnchor, constant: 16),
      personBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      personBtn.heightAnchor.constraint(equalToConstant: 32),
      personBtn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
    ])
    
    NSLayoutConstraint.activate([
      animationView.topAnchor.constraint(equalTo: foodBtn.bottomAnchor, constant: -5),
      animationView.heightAnchor.constraint(equalToConstant: 5),
      animationView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
    ])
    
    animationViewleading = animationView.leadingAnchor.constraint(equalTo: leadingAnchor)
    animationViewleading?.isActive = true
  }
  
  // MARK: - Action Handler
//  @objc private func areaDidTap(_ sender: UIButton) {
//    UIView.animate(withDuration: 0.2) {
//      self.areaBtnHeight?.constant += 20
//      self.layoutIfNeeded()
//    }
//    let settingVC = SettingRegionViewController()
//    settingVC.modalPresentationStyle = .fullScreen
//    
//  }
  
  @objc private func refreshDidTap(_ sender: UIButton) {
    print("refreshDidTap")
  }
  
  @objc private func foodAndPersonDidTap(_ sender: UIButton) {
    let viewWidth = self.frame.width / 2
    
    UIView.animate(withDuration: 0.3) {
      if sender.titleLabel?.text == "food" {
        
        self.foodAndPersonAnimationChack(
          UIColor.systemGray3,
          UIColor.systemGray5,
          UIColor.systemOrange,
          UIColor.systemGray
        )
        self.animationViewleading?.constant -= viewWidth
        self.layoutIfNeeded()
      } else {
        self.foodAndPersonAnimationChack(
          UIColor.systemGray5,
          UIColor.systemGray3,
          UIColor.systemGray,
          UIColor.systemOrange
        )
        self.animationViewleading?.constant = viewWidth
        self.layoutIfNeeded()
      }
    }
  }
  
  private func foodAndPersonAnimationChack(
    _ foodBackgroundColor: UIColor,
    _ personBackgroundColor: UIColor,
    _ foodTitleColor: UIColor,
    _ personTitleColor: UIColor
  ) {
    foodBtn.backgroundColor = foodBackgroundColor
    personBtn.backgroundColor = personBackgroundColor
    foodBtn.setTitleColor(foodTitleColor, for: .normal)
    personBtn.setTitleColor(personTitleColor, for: .normal)
  }
}

// MARK: - Extension


