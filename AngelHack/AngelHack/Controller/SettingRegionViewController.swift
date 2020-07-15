//
//  SettingRegionViewController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/13.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SettingRegionViewController: UIViewController {
  // MARK: - Properties
  private let settingRegionNavigationView = SettingRegionNavigationView()
  private let settingRegionBodyView = SettingRegionBodyView()
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGray6
    view.addSubview(settingRegionNavigationView)
    view.addSubview(settingRegionBodyView)
    settingRegionNavigationView.translatesAutoresizingMaskIntoConstraints = false
    settingRegionBodyView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      settingRegionNavigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      settingRegionNavigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      settingRegionNavigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      settingRegionNavigationView.heightAnchor.constraint(equalToConstant: 70),
      
      settingRegionBodyView.topAnchor.constraint(equalTo: settingRegionNavigationView.bottomAnchor),
      settingRegionBodyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      settingRegionBodyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      settingRegionBodyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
    
  }
  
  // MARK: - Layout
  
  // MARK: - Action Handler
}

// MARK: - Extension

