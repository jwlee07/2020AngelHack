//
//  TalkContentsView.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol TalkContentsViewDelegate: class {
  func nextView()
}

class TalkContentsView: UIView {
  // MARK: - Properties
  weak var delegate: TalkContentsViewDelegate?
  private let topImageView = UIImageView()
  private let bottomImageBtn = UIButton()
  
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
//    TalkTopImage
    [topImageView, bottomImageBtn].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    topImageView.image = UIImage(named: "TalkTopImage")
    
    bottomImageBtn.setImage(UIImage(named: "TalkBottomImage"), for: .normal)
    bottomImageBtn.addTarget(self, action: #selector(bottomImageDidTapBtn), for: .touchUpInside)
    bottomImageBtn.adjustsImageWhenHighlighted = false
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      topImageView.topAnchor.constraint(equalTo: topAnchor),
      topImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      topImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      bottomImageBtn.topAnchor.constraint(equalTo: topImageView.bottomAnchor),
      bottomImageBtn.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
  
  // MARK: - Action Handler
  @objc private func bottomImageDidTapBtn(_ sender: UIButton) {
    delegate?.nextView()
  }
}

// MARK: - Extension


