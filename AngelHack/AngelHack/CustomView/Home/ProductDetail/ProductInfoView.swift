//
//  ProductInfoView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoView: UIView {
  
  // MARK: - Property
  
  let productName: UILabel = {
    let label = UILabel()
    label.text = "A급 맛 자랑하는 감자"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()
  
  let unitImageView = UIImageView()
  let priceImageView = UIImageView()
  let deadlineImageView = UIImageView()
  
  var unitLabel: UILabel = {
    let label = UILabel()
    label.text = "5kg, 10개"
    return label
  }()
  
  var priceLabel: UILabel = {
    let label = UILabel()
    label.text = "5,000원"
    return label
  }()
  
  var deadlineLabel: UILabel = {
    let label = UILabel()
    label.text = "2020.07.30"
    return label
  }()
  
  let sellerInfoView: UIView = {
    let view = UIView()
    return view
  }()
  
  var sellerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemGray3
    return imageView
  }()
  
  var sellerName: UILabel = {
    let label = UILabel()
    label.text = "멋쟁이 농부"
    label.shadowColor = .black
    return label
  }()
  
  var sellerMapName: UILabel = {
    let label = UILabel()
    label.text = "드넓은 농장"
    return label
  }()
  
  var sellerScore: UILabel = {
    let label = UILabel()
    label.text = "4.5"
    label.textColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1)
    return label
  }()
  
  
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    productInfoUI()
    sellerInfoUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  private func productInfoUI() {
    
    let selfGuide = self.safeAreaLayoutGuide
    let padding: CGFloat = 50
    let imageSize: CGFloat = 30
    let margin: CGFloat = 15
    let minMargin: CGFloat = 5
    let sellerViewHeight: CGFloat = 100
    
    unitImageView.image = UIImage(named: "단위")?.withTintColor(UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1))
    priceImageView.image = UIImage(named: "가격")?.withTintColor(UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1))
    deadlineImageView.image = UIImage(named: "마감일")?.withTintColor(UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1))
    
    [productName, unitImageView, priceImageView, deadlineImageView, unitLabel, priceLabel, deadlineLabel, sellerInfoView].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      productName.topAnchor.constraint(equalTo: selfGuide.topAnchor, constant: margin),
      productName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      
      unitImageView.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: margin),
      unitImageView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor, constant: padding),
      unitImageView.widthAnchor.constraint(equalToConstant: imageSize),
      unitImageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      unitLabel.topAnchor.constraint(equalTo: unitImageView.bottomAnchor, constant: minMargin),
      unitLabel.centerXAnchor.constraint(equalTo: unitImageView.centerXAnchor),
      
      priceImageView.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: margin),
      priceImageView.centerXAnchor.constraint(equalTo: productName.centerXAnchor),
      priceImageView.widthAnchor.constraint(equalToConstant: imageSize),
      priceImageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      priceLabel.topAnchor.constraint(equalTo: priceImageView.bottomAnchor, constant: minMargin),
      priceLabel.centerXAnchor.constraint(equalTo: priceImageView.centerXAnchor),
      
      deadlineImageView.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: margin),
      deadlineImageView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor, constant: -padding),
      deadlineImageView.widthAnchor.constraint(equalToConstant: imageSize),
      deadlineImageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      deadlineLabel.topAnchor.constraint(equalTo: deadlineImageView.bottomAnchor, constant: minMargin),
      deadlineLabel.centerXAnchor.constraint(equalTo: deadlineImageView.centerXAnchor),
      
      sellerInfoView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: margin),
      sellerInfoView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      sellerInfoView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      sellerInfoView.heightAnchor.constraint(equalToConstant: sellerViewHeight),
    ])
  }
  private func sellerInfoUI() {
    
    let imageSize: CGFloat = 50
    let margin: CGFloat = 15
    let minMargin: CGFloat = 5
    
    sellerImageView.image = UIImage(named: "진욱이")
    
    [sellerImageView, sellerName, sellerMapName, sellerScore].forEach {
      sellerInfoView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      sellerImageView.leadingAnchor.constraint(equalTo: sellerInfoView.leadingAnchor, constant: minMargin),
      sellerImageView.centerYAnchor.constraint(equalTo: sellerInfoView.centerYAnchor),
      sellerImageView.widthAnchor.constraint(equalToConstant: imageSize),
      sellerImageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      sellerName.centerYAnchor.constraint(equalTo: sellerInfoView.centerYAnchor , constant: -margin),
      sellerName.leadingAnchor.constraint(equalTo: sellerImageView.trailingAnchor, constant: margin),
      
      sellerMapName.centerYAnchor.constraint(equalTo: sellerInfoView.centerYAnchor , constant: margin),
      sellerMapName.leadingAnchor.constraint(equalTo: sellerImageView.trailingAnchor, constant: margin),
      
      sellerScore.trailingAnchor.constraint(equalTo: sellerInfoView.trailingAnchor, constant: -margin),
      sellerScore.centerYAnchor.constraint(equalTo: sellerInfoView.centerYAnchor)
    ])
  }
}
