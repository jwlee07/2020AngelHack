//
//  ProductResidentTopView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/17.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductResidentTopView: UIView {
  
  // MARK: - Property
  
  
  lazy var productImageView: UIImageView = {
    let imageVIew = UIImageView()
    imageVIew.layer.cornerRadius = 15
    imageVIew.clipsToBounds = true
    return imageVIew
  }()
  
  let productCountLabel: UILabel = {
    let label = UILabel()
    label.text = "10/10"
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 15)
    return label
  }()
  
  let productNameTextfield: UITextField = {
    let textfield = UITextField()
    textfield.text = "오늘 수확한 감자 팝니다."
    textfield.borderStyle = .roundedRect
    return textfield
  }()
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setImageViewIn()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setUI() {
    
    let imageWidth: CGFloat = 150
    let imageHeight: CGFloat = 110
    let margin: CGFloat = 30
    let padding: CGFloat = 10
    let textfieldHeight: CGFloat = 50
    let selfGuide = self.safeAreaLayoutGuide
    
    productImageView.image = UIImage(named: "감자_1")
    
    [productImageView, productCountLabel, productNameTextfield].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      productImageView.topAnchor.constraint(equalTo: selfGuide.topAnchor),
      productImageView.centerXAnchor.constraint(equalTo: selfGuide.centerXAnchor),
      productImageView.widthAnchor.constraint(equalToConstant: imageWidth),
      productImageView.heightAnchor.constraint(equalToConstant: imageHeight),
      
      productNameTextfield.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: margin),
      productNameTextfield.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor, constant: padding),
      productNameTextfield.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor, constant: -padding),
      productNameTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight)
    ])
  }
  func setImageViewIn() {
    
    let margin: CGFloat = 5
    
    productImageView.addSubview(productCountLabel)
    productCountLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      productCountLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor, constant: margin),
      productCountLabel.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: -margin)
    ])
  }
}
