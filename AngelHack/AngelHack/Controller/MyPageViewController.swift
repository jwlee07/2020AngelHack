//
//  MyPageViewController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
  
  // MARK: - Property
  
  private let symbolSize = UIImage.SymbolConfiguration(pointSize: 24)
  
  private let mypageTableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  private lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.left", withConfiguration: symbolSize), for: .normal)
    button.tintColor = .white
    return button
  }()
  
  private let myPageTitle: UILabel = {
    let label = UILabel()
    label.text = "마이페이지"
    return label
  }()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - SetUp Layout
  
  private func setUI() {
    
    let guide = view.safeAreaLayoutGuide
    
    navigationController?.navigationBar.isHidden = true
    
    [dismissButton, myPageTitle, mypageTableView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    
  }
}
