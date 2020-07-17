 //
//  ProductResidentViewController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/17.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductResidentViewController: UIViewController {
  // MARK: - Property
  
  let productResidentTopView = ProductResidentTopView()
  
  let symbolSize = UIImage.SymbolConfiguration(pointSize: 24)
  
  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.left", withConfiguration: symbolSize), for: .normal)
    button.tintColor = .darkGray
    return button
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "상품 등록하기"
    return label
  }()
  
  let productResidentCompleteButton: UIButton = {
    let button = UIButton()
    button.setTitle("작성 완료", for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    
  }
  // MARK: - SetUp Layout
  
  func setUI() {
    
    let guide = view.safeAreaLayoutGuide
    let margin: CGFloat = 10
    let imageMargin: CGFloat = 100
    
    
    
    [dismissButton, titleLabel, productResidentTopView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      dismissButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin),
      dismissButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      
      titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin),
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      productResidentTopView.topAnchor.constraint(equalTo: guide.topAnchor, constant: imageMargin),
      productResidentTopView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      productResidentTopView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      productResidentTopView.trailingAnchor.constraint(equalTo: guide.trailingAnchor)
    ])
  }
}
