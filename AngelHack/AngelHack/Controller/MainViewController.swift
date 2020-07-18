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
  let mainTableView = MainTableCustomView()
  let collectionViewLayout = UICollectionViewFlowLayout()
  lazy var mainCollectionView = MainCollectionCustomView(frame: .zero, superViewWidth: view.frame.width, superViewHeight: view.frame.height)
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setMainViewUI()
  }
  
  // MARK: - Setup Layout
  
  func setMainViewUI() {
    
    navigationController?.navigationBar.isHidden = true
    
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(mainCollectionView)
    [customNavigationBarView, mainCollectionView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
      NSLayoutConstraint.activate([
        customNavigationBarView.topAnchor.constraint(equalTo: guide.topAnchor),
        customNavigationBarView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
        customNavigationBarView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
        customNavigationBarView.heightAnchor.constraint(equalToConstant: view.frame.height / 3.6)
      ])
    
    NSLayoutConstraint.activate([
      mainCollectionView.topAnchor.constraint(equalTo: customNavigationBarView.bottomAnchor, constant: 10),
      mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  // MARK: - Action
  
  @objc func didTapMapSearchButton(_ sender: UIButton) {
    let settingVC = SettingRegionViewController()
    present(settingVC, animated: true)
  }
  
}

