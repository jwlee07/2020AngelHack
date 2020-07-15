//
//  ProductDetailViewController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/14.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
  
  // MARK: - Property
  
  let detailCustomView = DetailCustomView()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
  }
  
  // MARK: - SetupLayout
  
  func setUI() {
    
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(detailCustomView)
    detailCustomView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      detailCustomView.topAnchor.constraint(equalTo: guide.topAnchor),
      detailCustomView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      detailCustomView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      detailCustomView.heightAnchor.constraint(equalToConstant: view.frame.height)
    ])
  }
}
