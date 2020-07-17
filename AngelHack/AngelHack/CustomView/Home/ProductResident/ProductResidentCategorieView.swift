//
//  ProductResidentCategorieView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/17.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductResidentCategorieView: UIView {
  
  // MARK: - Property
  let categorieTableView = UITableView()
  
  let categorieListArr = ["농/수산물", "감자", "5kg", "15,000원", "2020.07.30"]
  
  let symbolSize = UIImage.SymbolConfiguration(pointSize: 24)
  
  lazy var presentButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "chevron.right", withConfiguration: symbolSize), for: .normal)
    button.tintColor = .black
    return button
  }()
  
  // MARK: - init View
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  func setUI() {
    
    let selfGuide = self.safeAreaLayoutGuide
    
    categorieTableView.dataSource = self
    categorieTableView.rowHeight = 50
    categorieTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Custom")
    
    self.addSubview(categorieTableView)
    categorieTableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      categorieTableView.topAnchor.constraint(equalTo: selfGuide.topAnchor),
      categorieTableView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      categorieTableView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      categorieTableView.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor)
    ])
  }
}

// MARK: - UITableViewDataSource

extension ProductResidentCategorieView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    categorieListArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = categorieTableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath)
    cell.textLabel?.text = categorieListArr[indexPath.row]
    return cell
  }
}
