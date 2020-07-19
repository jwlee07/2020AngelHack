//
//  TalkViewController.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TalkViewController: UIViewController {
  // MARK: - Properties
  private let talkTopView = TalkTopView()
  private let talkBottomView = TalkBottomView()
  private let talkContentsView = TalkContentsView()
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setLayout()
  }
  
  // MARK: - Layout
  private func setUI() {
    view.backgroundColor = .systemBackground
    
    [talkTopView, talkBottomView, talkContentsView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    tabBarController?.tabBar.isHidden = true
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      talkTopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      talkTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      talkTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      talkBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      talkBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      talkBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      talkContentsView.topAnchor.constraint(equalTo: talkTopView.bottomAnchor),
      talkContentsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      talkContentsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      talkContentsView.bottomAnchor.constraint(equalTo: talkBottomView.topAnchor)
    ])
  }
  
  // MARK: - Action Handler
  
}

// MARK: - Extension

