//
//  CustomNavigationBarView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/13.
//  Copyright © 2020 jwlee. All rights reserved.
//


import UIKit

protocol CustomNavigationBarViewDelegate: class {
  func nextViewDangerous()
}

class CustomNavigationBarView: UIView {
  // MARK: - Properties
  weak var delegate: CustomNavigationBarViewDelegate?
  private let mainLogo = UIImageView()
  private let subTitleLable = UILabel()
  private let subTitleText = "감자"
  private let commentLabel = UILabel()
  private let commentText = "100"
  private let searchTextField = UITextField()
  private let issueBtn = UIButton(type: .system)
  private let filterCollectionView = FilterCollectionView()
  
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
    [mainLogo, subTitleLable, commentLabel, issueBtn, searchTextField, filterCollectionView].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    mainLogo.image = UIImage(named: "mainLogo")
    
    subTitleLable.text = "버려질 위기의 \(subTitleText)는"
    subTitleLable.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 24)
    
    commentLabel.text = "현재 총 \(commentText)kg"
    commentLabel.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 24)
    
    issueBtn.alpha = 0.4
    issueBtn.setTitle("구하러가기 >", for: .normal)
    issueBtn.setTitleColor(UIColor(red: 0.125, green: 0.737, blue: 0.584, alpha: 1), for: .normal)
    issueBtn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 10)
    issueBtn.addTarget(self, action: #selector(issueBtnDidTap), for: .touchUpInside)
    
//    searchTextField.placeholder = "B끗 상품들을 만나러 가실래요?"
    searchTextField.leftView = TextFieldInImageView()
    searchTextField.leftViewMode = .always
    searchTextField.borderStyle = .roundedRect
    
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      mainLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
      mainLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      subTitleLable.topAnchor.constraint(equalTo: mainLogo.bottomAnchor, constant: 24),
      subTitleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      
      commentLabel.topAnchor.constraint(equalTo: subTitleLable.bottomAnchor, constant: 4),
      commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      
//      issueBtn.topAnchor.constraint(equalTo: subTitleLable.bottomAnchor, constant: 4),
      issueBtn.centerYAnchor.constraint(equalTo: commentLabel.centerYAnchor),
      issueBtn.leadingAnchor.constraint(equalTo: commentLabel.trailingAnchor, constant: 10),
      
      searchTextField.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 18),
      searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      searchTextField.heightAnchor.constraint(equalToConstant: 38),
      
      filterCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
      filterCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      filterCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      filterCollectionView.heightAnchor.constraint(equalToConstant: 30),
      filterCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  // MARK: - Action Handler
  
  @objc private func issueBtnDidTap(_ sender: UIButton) {
    delegate?.nextViewDangerous()
    print(11)
  }
}

// MARK: - Extension



