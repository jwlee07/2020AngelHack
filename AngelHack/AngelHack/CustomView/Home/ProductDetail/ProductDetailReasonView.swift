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
