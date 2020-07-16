//
//  MainViewController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol ADelegate: class {
  func pre()
}

class MainViewController: UIViewController {
  
  // MARK: - Property
  
  let customNavigationBarView = CustomNavigationBarView()
  let mainCollectionView = MainCollectionCustomView()
  let mainTableView = MainTableCustomView()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNaviHidden()
    setMainViewUI()
    setTopViewUI()
//    setTableViewUI()
    
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNaviHidden()
  }
  
  // MARK: - Setup Layout
  
  private func setNaviHidden() {
    navigationController?.navigationBar.isHidden = true
  }

  private func setTopViewUI() {
    
    let viewHeight = view.frame.height
    
    [customNavigationBarView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      let guide = view.safeAreaLayoutGuide
      
      NSLayoutConstraint.activate([
        customNavigationBarView.topAnchor.constraint(equalTo: guide.topAnchor),
        customNavigationBarView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
        customNavigationBarView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
        customNavigationBarView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -viewHeight / 4)
      ])
    }
  }
  func setMainViewUI() {
    
    let mainChangeViewArr = [mainCollectionView, mainTableView]
    
    let guide = view.safeAreaLayoutGuide
    let viewHeight = view.frame.height
    let padding: CGFloat = 10
    
    
    
    
    view.addSubview(mainCollectionView)
    mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
    
    mainCollectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding).isActive = true
    mainCollectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding).isActive = true
    
    
    NSLayoutConstraint.activate([
      mainCollectionView.topAnchor.constraint(equalTo: guide.topAnchor, constant: viewHeight / 6),
      mainCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
  
  // MARK: - Action
  
  @objc func didTapMapSearchButton(_ sender: UIButton) {
    let settingVC = SettingRegionViewController()
    present(settingVC, animated: true)
  }
  
}
