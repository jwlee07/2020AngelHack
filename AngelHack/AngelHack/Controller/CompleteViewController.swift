//
//  CompleteViewController.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
  // MARK: - Properties
  private let customAlertView = UIView()
  private let imageView = UIImageView()
  private let comment = UILabel()
  private let selectionProductText = "감자"
  private let totalText = "100"
  private let escaped = "5"
  private lazy var commentText = """
  버려질 위기에 처한 \(selectionProductText)\n
  \(totalText)kg 중 \(escaped)kg을 구하셨습니다!
  """
  private let moreBtn = UIButton()
  private let dismissBtn = UIButton()
  
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setLayout()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    UIView.animate(withDuration: 0.5) {
      self.customAlertView.alpha = 1
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    UIView.animate(withDuration: 1) {
      self.customAlertView.alpha = 0
    }
  }
  
  // MARK: - Layout
  private func setUI() {
    view.addSubview(customAlertView)
    customAlertView.translatesAutoresizingMaskIntoConstraints = false
    
    [imageView, comment, moreBtn, dismissBtn].forEach {
      customAlertView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    
    customAlertView.alpha = 0
    customAlertView.backgroundColor = .systemBackground
    customAlertView.layer.cornerRadius = 10
    customAlertView.clipsToBounds = true
    
    imageView.image = UIImage(named: "CompleteImage")
    
    comment.numberOfLines = 0
    comment.text = """
     버려질 위기에 처한 \(selectionProductText)\n
     \(totalText)kg 중 \(escaped)kg을 구하셨습니다!
     """
    comment.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 18)
    comment.textAlignment = .center
    
    let attributedStr = NSMutableAttributedString(string: comment.text!)
    
    attributedStr.addAttribute(.foregroundColor, value: UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1), range: (comment.text! as NSString).range(of: selectionProductText))
    attributedStr.addAttribute(.foregroundColor, value: UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1), range: (comment.text! as NSString).range(of: totalText + "kg"))
    attributedStr.addAttribute(.foregroundColor, value: UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1), range: (comment.text! as NSString).range(of: escaped + "kg"))
    
    comment.attributedText = attributedStr
    
    moreBtn.setTitle("더 구하러 가기 >", for: .normal)
    moreBtn.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 12)
    moreBtn.setTitleColor(UIColor(red: 0.317, green: 0.317, blue: 0.317, alpha: 1), for: .normal)
    
    dismissBtn.setTitle("확인", for: .normal)
    dismissBtn.backgroundColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1)
    dismissBtn.addTarget(self, action: #selector(dismissDidTapBtn), for: .touchUpInside)
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      customAlertView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 203),
      customAlertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
      customAlertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
      customAlertView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -234),
      
      imageView.topAnchor.constraint(equalTo: customAlertView.topAnchor, constant: 49),
      imageView.centerXAnchor.constraint(equalTo: customAlertView.centerXAnchor),
      
      comment.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
      comment.centerXAnchor.constraint(equalTo: customAlertView.centerXAnchor),
      
      moreBtn.topAnchor.constraint(equalTo: comment.bottomAnchor, constant: 21),
      moreBtn.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
      
      
      dismissBtn.leadingAnchor.constraint(equalTo: customAlertView.leadingAnchor),
      dismissBtn.trailingAnchor.constraint(equalTo: customAlertView.trailingAnchor),
      dismissBtn.bottomAnchor.constraint(equalTo: customAlertView.bottomAnchor)
    ])
  }
  deinit {
    print(1111111111)
  }
  
  // MARK: - Action Handler
  @objc private func dismissDidTapBtn(_ sender: UIButton) {
    
    dismiss(animated: false, completion: nil)
  }
}

// MARK: - Extension


