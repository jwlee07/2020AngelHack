//
//  ProductDetailReasonView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductDetailReasonView: UIView {
  // MARK: - Property
  
  var detailReasonView: UIView = {
    let view = UIView()
    return view
  }()
  
  let reasonLabel: UILabel = {
    let label = UILabel()
    label.text = "B급이 된 상세 이유"
    return label
  }()
  
  let sellerInquiryButton: UIButton = {
    let button = UIButton()
    button.setTitle("판매자에게 문의하기", for: .normal)
    button.setTitleColor(.systemGray, for: .normal)
    button.backgroundColor = .systemGray3
    return button
  }()
  
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - SetUp Layout
  
  func setUI() {
    
    let selfGuide = self.safeAreaLayoutGuide
    let buttonHeight: CGFloat = 50
    
    [detailReasonView, reasonLabel, sellerInquiryButton].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate([
      detailReasonView.topAnchor.constraint(equalTo: selfGuide.topAnchor),
      detailReasonView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      detailReasonView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      detailReasonView.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor, constant: -buttonHeight),
      
      sellerInquiryButton.topAnchor.constraint(equalTo: detailReasonView.bottomAnchor),
      sellerInquiryButton.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      sellerInquiryButton.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      sellerInquiryButton.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor),
      
      
      reasonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      reasonLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
  }
}
