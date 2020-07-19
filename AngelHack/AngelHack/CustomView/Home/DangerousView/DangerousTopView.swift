//
//  DangerousTopView.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/18.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol DangerousTopViewDelegate: class {
  func popOnView()
}

class DangerousTopView: UIView {
  // MARK: - Properties
  weak var delegate: DangerousTopViewDelegate?
  private let dismissBtn = UIButton()
  private let commentLabel = UILabel()
  private let topMainImageView = UIImageView()
  private let imageViewCommentLabel = UILabel()
  
  
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
    backgroundColor = .systemBackground
    
    [dismissBtn, commentLabel, topMainImageView, imageViewCommentLabel].forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    topMainImageView.addSubview(imageViewCommentLabel)
//    imageViewCommentLabel.translatesAutoresizingMaskIntoConstraints = false

    dismissBtn.addTarget(self, action: #selector(dismissBtnDidTap), for: .touchUpInside)
    dismissBtn.setImage(UIImage(named: "dismissBtn"), for: .normal)
    
    commentLabel.text = "위기의 감자...👀"
    commentLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 22)
    
    topMainImageView.image = UIImage(named: "갬쥐")
    topMainImageView.contentMode = .scaleToFill
    topMainImageView.layer.cornerRadius = 10
    topMainImageView.clipsToBounds = true
    
    imageViewCommentLabel.text = """
    우리의 감자들이\n
    태풍으로 인한 상처로\n
    버려질 위기에 처했어요
    """
    
    imageViewCommentLabel.textAlignment = .center
    imageViewCommentLabel.numberOfLines = 0
    imageViewCommentLabel.textColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
    imageViewCommentLabel.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 15)
    imageViewCommentLabel.lineBreakMode = .byWordWrapping
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      dismissBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
      dismissBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      
      commentLabel.topAnchor.constraint(equalTo: dismissBtn.bottomAnchor, constant: 24),
      commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      
      topMainImageView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 16),
      topMainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      topMainImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      topMainImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
      
      imageViewCommentLabel.centerYAnchor.constraint(equalTo: topMainImageView.centerYAnchor),
      imageViewCommentLabel.centerXAnchor.constraint(equalTo: topMainImageView.centerXAnchor)
    ])
  }
  
  // MARK: - Action Handler
  @objc private func dismissBtnDidTap(_ sender: UIButton) {
    delegate?.popOnView()
  }
}

// MARK: - Extension


