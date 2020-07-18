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
  let productResidentCategorieView = ProductResidentCategorieView()
  
  let symbolSize = UIImage.SymbolConfiguration(pointSize: 24)
  
  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.left", withConfiguration: symbolSize), for: .normal)
    button.tintColor = .darkGray
    button.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
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
    button.backgroundColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1)
    button.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
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
    let topMargin: CGFloat = 100
    let tableViewMargin: CGFloat = 150
    let topViewHeight: CGFloat = 200
    let buttonHeight: CGFloat = 72
    
    [dismissButton, titleLabel, productResidentTopView, productResidentCategorieView, productResidentCompleteButton].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      dismissButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin),
      dismissButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      
      titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin),
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      productResidentTopView.topAnchor.constraint(equalTo: guide.topAnchor, constant: topMargin),
      productResidentTopView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      productResidentTopView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      productResidentTopView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      productResidentTopView.heightAnchor.constraint(equalToConstant: topViewHeight),
    
      productResidentCategorieView.topAnchor.constraint(equalTo: productResidentTopView.bottomAnchor),
      productResidentCategorieView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      productResidentCategorieView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      productResidentCategorieView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -tableViewMargin),
      
      productResidentCompleteButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      productResidentCompleteButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      productResidentCompleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      productResidentCompleteButton.heightAnchor.constraint(equalToConstant: buttonHeight)
    ])
  }
  
  // MARK: - Action Button
  @objc func didTapDismissButton(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
}
