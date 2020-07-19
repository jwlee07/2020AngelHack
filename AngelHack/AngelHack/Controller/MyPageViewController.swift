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
  
  let sellerProfileView = SellerProfileView()
  let sellerHistoryView = SellerHistoryView()
  let sellerCategoryListView = SellerCategoryListView()
  
  
  private let symbolSize = UIImage.SymbolConfiguration(pointSize: 24)
  
  private let myPageTableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  private lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.left", withConfiguration: symbolSize), for: .normal)
    button.tintColor = .black
    return button
  }()
  
  private let myPageTitle: UILabel = {
    let label = UILabel()
    label.text = "마이페이지"
    return label
  }()
  
  lazy var myPageCustomViewArr = [sellerProfileView, sellerHistoryView, sellerCategoryListView]
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTableView()
    setUI()
  }
  
  // MARK: - SetUp Layout
  
  private func setUpTableView() {
    
    myPageTableView.allowsSelection = false
    myPageTableView.dataSource = self
    myPageTableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
  }
  
  private func setUI() {
    
    let selfGuide = view.safeAreaLayoutGuide
    let margin: CGFloat = 10
    
    navigationController?.navigationBar.isHidden = true
    
    [dismissButton, myPageTitle, myPageTableView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      dismissButton.topAnchor.constraint(equalTo: selfGuide.topAnchor, constant: margin),
      dismissButton.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor, constant: margin),
      
      myPageTitle.topAnchor.constraint(equalTo: selfGuide.topAnchor, constant: margin),
      myPageTitle.centerXAnchor.constraint(equalTo: selfGuide.centerXAnchor),
      
      myPageTableView.topAnchor.constraint(equalTo: myPageTitle.bottomAnchor, constant: margin),
      myPageTableView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor, constant: margin),
      myPageTableView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor, constant: -margin),
      myPageTableView.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor)
    ])
  }
}

// MARK: - UITableViewDataSource

extension MyPageViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    myPageCustomViewArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let myPageCell = myPageTableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.identifier, for: indexPath) as! MyPageTableViewCell
    myPageCell.myPageView = myPageCustomViewArr[indexPath.row]
    switch indexPath.row {
    case 0:
      myPageTableView.rowHeight = 100
    case 1:
      myPageTableView.rowHeight = 120
    case 2:
      myPageTableView.rowHeight = 240
    default:
      break
    }
    return myPageCell
  }
}
