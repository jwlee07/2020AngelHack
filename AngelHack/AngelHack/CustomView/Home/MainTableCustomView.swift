//
//  MainTableCustomView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MainTableCustomView: UIView {
  
  // MARK: - Property
    
  let mainTableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setTableView()
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setTableView() {
    
    mainTableView.dataSource = self
    mainTableView.rowHeight = 135
    mainTableView.register(MainTableViewCell.self, forCellReuseIdentifier: "Custom")
  }
  
  func setUI() {
    
    self.addSubview(mainTableView)
    mainTableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      mainTableView.topAnchor.constraint(equalTo: self.topAnchor),
      mainTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      mainTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      mainTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}

 // MARK: - UITableViewDataSource

extension MainTableCustomView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = mainTableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! MainTableViewCell
    cell.personImageView.image = UIImage(named: "jwlee_logo")
    return cell
  }
}
