//
//  TalkTopView.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol TalkTopViewDelegate: class {
  func dismissView()
}

class TalkTopView: UIView {
  // MARK: - Properties
  weak var delegate: TalkTopViewDelegate?
  private let dismissBtn = UIButton()
  private let titleLabel = UILabel()
  private let moreBtn = UIButton()
  
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
    [dismissBtn, titleLabel, moreBtn].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    dismissBtn.setImage(UIImage(named: "dismissBtn"), for: .normal)
    dismissBtn.addTarget(self, action: #selector(dismissDidTapBtn), for: .touchUpInside)
    
    titleLabel.text = "채팅하기"
    titleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    
    moreBtn.setImage(UIImage(named: "moreBtn"), for: .normal)
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      dismissBtn.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      dismissBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      dismissBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
      
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
      
      moreBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      moreBtn.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      moreBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
    ])
  }
  
  // MARK: - Action Handler
  @objc private func dismissDidTapBtn(_ sender: UIButton) {
    delegate?.dismissView()
  }
}

// MARK: - Extension

