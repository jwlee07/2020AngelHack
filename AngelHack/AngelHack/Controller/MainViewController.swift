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
  let collectionViewLayout = UICollectionViewFlowLayout()
  lazy var mainCollectionView = MainCollectionCustomView(frame: .zero, superViewWidth: view.frame.width, superViewHeight: view.frame.height)
  private let addBtn = UIButton()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setMainViewUI()
  }

  // MARK: - Setup Layout
  
  func setMainViewUI() {
    
    mainCollectionView.delegate = self
    customNavigationBarView.delegate = self
    navigationController?.navigationBar.isHidden = true
    
    let guide = view.safeAreaLayoutGuide
    
    addBtn.setImage(UIImage(named: "글쓰기"), for: .normal)
    addBtn.backgroundColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1)
    addBtn.layer.cornerRadius = 56 / 2
    addBtn.addTarget(self, action: #selector(addBtnDidTap), for: .touchUpInside)
    
    [customNavigationBarView, mainCollectionView, addBtn].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate([
      customNavigationBarView.topAnchor.constraint(equalTo: guide.topAnchor),
      customNavigationBarView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
      customNavigationBarView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10)
    ])
    
    NSLayoutConstraint.activate([
      mainCollectionView.topAnchor.constraint(equalTo: customNavigationBarView.bottomAnchor, constant: 10),
      mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      addBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      addBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      addBtn.widthAnchor.constraint(equalToConstant: 56),
      addBtn.heightAnchor.constraint(equalToConstant: 56)
    ])
  }
  
  // MARK: - Action
  
  @objc private func didTapMapSearchButton(_ sender: UIButton) {
    let settingVC = SettingRegionViewController()
    
    present(settingVC, animated: true)
  }
  
  @objc private func addBtnDidTap(_ sender: UIButton) {
    let productResidentViewController = ProductResidentViewController()

<<<<<<< HEAD
//    productResidentViewController.modalPresentationStyle = .overFullScreen
//    present(productResidentViewController, animated: false)
=======

//    productResidentViewController.modalPresentationStyle = .overFullScreen
//    present(productResidentViewController, animated: false)

>>>>>>> 9990ed21ecda1d774532748823daadef72f4efad

//    productResidentViewController.modalPresentationStyle = .overFullScreen
//    present(productResidentViewController, animated: false)

    
    navigationController?.pushViewController(productResidentViewController, animated: true)
  }
}

extension MainViewController: MainCollectionCustomViewDelegate {
  func nextView() {
    let productDetailViewController = ProductDetailViewController()
    
    navigationController?.pushViewController(productDetailViewController, animated: true)
  }
}

extension MainViewController: CustomNavigationBarViewDelegate {
  func nextViewDangerous() {
    let dangerousViewController = DangerousViewController()
    
    navigationController?.pushViewController(dangerousViewController, animated: true)
  }
}


