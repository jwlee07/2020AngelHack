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
  
  let detailTableVIew = UITableView()
  
  let productImageView = DetailProductImageCustomView()
  let productInfoView = ProductInfoView()
  
  lazy var productViewArr = [productImageView, productInfoView]
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTableView()
    setUI()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    detailTableVIew.reloadData()
  }
  
  // MARK: - SetupLayout
  
  private func setTableView() {
    detailTableVIew.dataSource = self
    detailTableVIew.rowHeight = view.frame.height / 3
    detailTableVIew.register(DetailProductTableViewCell.self, forCellReuseIdentifier: "Custom")
  }
  
  
  private func setUI() {
    
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(detailTableVIew)
    detailTableVIew.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      detailTableVIew.topAnchor.constraint(equalTo: guide.topAnchor),
      detailTableVIew.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      detailTableVIew.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      detailTableVIew.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
    
  }
}

// MARK: - UITableViewDataSource

extension ProductDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    productViewArr.count

  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let detailCell = detailTableVIew.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! DetailProductTableViewCell
    detailCell.productView = productViewArr[indexPath.row]
    return detailCell
    
  }
}

