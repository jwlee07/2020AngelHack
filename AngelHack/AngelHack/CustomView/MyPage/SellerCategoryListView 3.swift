//
//  SellerCategoryListView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SellerCategoryListView: UIView {
  
  // MARK: - Property
  
  let listTableView = UITableView()
  
  let listImageArr = ["지역", "판매자", "공지사항", "앱설정"].compactMap {
    UIImage.init(named:$0)
  }
  let listTextArr = ["지역 설정하기", "판매자 인증하기", "공지사항", "앱설정"]
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupTableView()
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setupTableView() {
    listTableView.allowsSelection = false
    listTableView.dataSource = self
    listTableView.rowHeight = 60
    listTableView.register(SellerCategoryListTableViewCell.self, forCellReuseIdentifier: SellerCategoryListTableViewCell.identifier)
  }
  func setUI() {
    
    self.addSubview(listTableView)
    listTableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      listTableView.topAnchor.constraint(equalTo: self.topAnchor),
      listTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      listTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      listTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
    
  }
}

// MARK: - UITableViewDataSource

extension SellerCategoryListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    listImageArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let categoryListCell = listTableView.dequeueReusableCell(withIdentifier: SellerCategoryListTableViewCell.identifier, for: indexPath) as! SellerCategoryListTableViewCell
    categoryListCell.categoryListImageView.image = listImageArr[indexPath.row]
    categoryListCell.categoryListLabel.text = listTextArr[indexPath.row]
    return categoryListCell
  }
}
