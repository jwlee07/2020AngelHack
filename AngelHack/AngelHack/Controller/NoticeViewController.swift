//
//  NoticeViewController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {
  
  // MARK: - Property
  
  let noticeTopView = NoticeTopCustomView()
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
  }
  
  // MARK: - SetUp Layout
  
  func setUI() {
    
    noticeTopView.backgroundColor = .systemGray
    
    let guide = view.safeAreaLayoutGuide
    let topViewHeight: CGFloat = 60
    
    [noticeTopView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      noticeTopView.topAnchor.constraint(equalTo: guide.topAnchor),
      noticeTopView.heightAnchor.constraint(equalToConstant: topViewHeight)
    ])
  }
}
