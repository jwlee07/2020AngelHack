//
//  DangerousViewController.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/18.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DangerousViewController: UIViewController {
  // MARK: - Properties
  private let dangerousTopView = DangerousTopView()
  private lazy var dangerousContentView = DangerousContentView(frame: .zero, superViewWidth: view.frame.width)
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setLayout()
  }
  
  // MARK: - Layout
  private func setUI() {
    view.backgroundColor = .systemBackground
    
    [dangerousTopView, dangerousContentView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    dangerousTopView.delegate = self
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      dangerousTopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      dangerousTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      dangerousTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      dangerousTopView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
      
      dangerousContentView.topAnchor.constraint(equalTo: dangerousTopView.bottomAnchor),
      dangerousContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      dangerousContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      dangerousContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension

extension DangerousViewController: DangerousTopViewDelegate {
  func popOnView() {
    navigationController?.popViewController(animated: true)
  }
}
