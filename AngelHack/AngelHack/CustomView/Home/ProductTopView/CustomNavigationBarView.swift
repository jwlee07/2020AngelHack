//
//  CustomNavigationBarView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/13.
//  Copyright © 2020 jwlee. All rights reserved.
//


import UIKit

class CustomNavigationBarView: UIView {
  // MARK: - Properties
  let subTitleLable = UILabel()
  let commentLabel = UILabel()
  let searchTextField = UITextField()
  let issueBtn = UIButton()
  let filterCollectionView = FilterCollectionView()
  
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
    [subTitleLable, issueBtn, searchTextField, filterCollectionView].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    subTitleLable.text = "B끗장터 ISSUE"
    subTitleLable.font = UIFont.init(name: "AppleSDGothicNeo-SemiBold", size: 26)
    
    issueBtn.setTitle("강원도는 지금 감자...", for: .normal)
    issueBtn.setTitleColor(.black, for: .normal)
    issueBtn.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-SemiBold", size: 24)
    
    searchTextField.placeholder = "B끗 상품들을 만나러 가실래요?"
    searchTextField.leftView = TextFieldInImageView()
    searchTextField.leftViewMode = .always
    searchTextField.borderStyle = .roundedRect
    
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      subTitleLable.topAnchor.constraint(equalTo: topAnchor, constant: 54),
      subTitleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      
      issueBtn.topAnchor.constraint(equalTo: subTitleLable.bottomAnchor, constant: 2),
      issueBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      
      searchTextField.topAnchor.constraint(equalTo: issueBtn.bottomAnchor, constant: 12),
      searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      searchTextField.heightAnchor.constraint(equalToConstant: 38),
      
      filterCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
      filterCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      filterCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      filterCollectionView.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension



