//
//  ProductResidentDetailExplanaView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/18.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductResidentDetailExplanaView: UIView {
  
  // MARK: - Property
  
  
  let detailExplanaTitle: UILabel = {
    let label = UILabel()
    label.text = "삼품 상세설명"
    label.textColor = .systemGray
    return label
  }()
  
  let detailExplanaView: UITextView = {
    let textView = UITextView()
    textView.layer.borderWidth = 1
    textView.layer.borderColor = UIColor.systemGray.cgColor
    textView.layer.cornerRadius = 10
    textView.clipsToBounds = true
    textView.text = " - 5kg 기준 15~20개 정도이고 크기는 평균입니다.\n\n - 못났지만 영양은 등뿍! 담긴 감자 입니다.\n\n - 직접 오시면 5% 할인 해 드립니다."
    return textView
  }()
  
  // MARK: - init View
  override init(frame: CGRect) {
    super.init(frame: frame)
    setTextView()
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setTextView() {
    detailExplanaView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
    detailExplanaView.delegate = self
  }
  
  func setUI() {
    
    let selfGuide = self.safeAreaLayoutGuide
    let margin: CGFloat = 15
    
    [detailExplanaTitle, detailExplanaView].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor, constant: margin).isActive = true
    }
    
    NSLayoutConstraint.activate([
      detailExplanaTitle.topAnchor.constraint(equalTo: selfGuide.topAnchor, constant: margin),
      
      detailExplanaView.topAnchor.constraint(equalTo: detailExplanaTitle.bottomAnchor, constant: margin),
      detailExplanaView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor, constant: -margin),
      detailExplanaView.heightAnchor.constraint(equalToConstant: 100)
    ])
  }
}

// MARK: - UITextViewDelegate

extension ProductResidentDetailExplanaView: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    let size = CGSize(width: self.frame.width, height: .infinity)
    let estimatedSize = textView.sizeThatFits(size)
    textView.constraints.forEach { (constraint) in
      if constraint.firstAttribute == .height {
        guard constraint.constant < 150 else { return }
        constraint.constant = estimatedSize.height
      }
    }
  }
}

