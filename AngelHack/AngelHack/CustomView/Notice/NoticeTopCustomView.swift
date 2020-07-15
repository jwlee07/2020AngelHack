//
//  NoticeCustomView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/13.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class NoticeTopCustomView: UIView {
  
  // MARK: - Property
  
  let activeNoticeButton: UIButton = {
    let button = UIButton()
    button.setTitle("활동알림", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemGray
    button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
    return button
  }()
  
  let keywordNoticeButton: UIButton = {
    let button = UIButton()
    button.setTitle("키워드 알림", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemGray
    button.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
    return button
  }()
  
  let animationView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemOrange
    return view
  }()
  
  var animationViewCneter: NSLayoutConstraint?
  
  
  // MARK: - View Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setUI() {
    
    let guide = self.safeAreaLayoutGuide
    let animationHeight: CGFloat = 5
    
    [activeNoticeButton, keywordNoticeButton].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
      $0.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
      $0.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
    }
    NSLayoutConstraint.activate([
      activeNoticeButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      keywordNoticeButton.leadingAnchor.constraint(equalTo: activeNoticeButton.safeAreaLayoutGuide.trailingAnchor)
    ])
    
    self.addSubview(animationView)
    animationView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      animationView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      animationView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
      animationView.heightAnchor.constraint(equalToConstant: animationHeight)
    ])
    animationViewCneter = animationView.leadingAnchor.constraint(equalTo: guide.leadingAnchor)
    animationViewCneter?.isActive = true
  }
  
  @objc func didTabButton(_ sender: UIButton) {
    
    let moveAnimationViewSize = self.frame.width / 2
    UIView.animate(withDuration: 0.5) {
      switch sender {
      case self.keywordNoticeButton:
        self.animationViewCneter?.constant += moveAnimationViewSize
        self.keywordNoticeButton.backgroundColor = .systemGray2
        self.activeNoticeButton.backgroundColor = .systemGray
        self.layoutIfNeeded()
      case self.activeNoticeButton:
        self.animationViewCneter?.constant -= moveAnimationViewSize
        self.activeNoticeButton.backgroundColor = .systemGray2
        self.keywordNoticeButton.backgroundColor = .systemGray
        self.layoutIfNeeded()
      default:
        break
      }
    }
  }
}

