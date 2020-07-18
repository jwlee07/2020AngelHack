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
    label.text = " - 5kg 기준 15~20개 정도이고 크기는 평균입니다.\n\n - 못났지만 영양은 듬뿍! 담긴 감자 입니다.\n\n - 직접 오시면 5% 할인 해드립니다 ^^ \n\n - 먹어보시고 구입하셔도 됩니다 !!^^"
    label.textAlignment = .left
    label.lineBreakMode = .byWordWrapping
    label.adjustsFontSizeToFitWidth = false
    label.numberOfLines = 0
    return label
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
    
    [detailReasonView, reasonLabel].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate([
      detailReasonView.topAnchor.constraint(equalTo: selfGuide.topAnchor),
      detailReasonView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      detailReasonView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      detailReasonView.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor),
      
      reasonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      reasonLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
  }
}
