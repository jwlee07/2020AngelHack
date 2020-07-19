//
//  DetailProductTableViewCell.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductResidentViewCell: UITableViewCell {
  
  // MARK: - Property
  
  var productView = UIView()
  static let identifier = "ProductResidentViewCell"

  // MARK: - init View
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      setUI()
    }
  // MARK: - SetUp Layout
  
  func setUI() {
    
    let contentViewGuide = contentView.safeAreaLayoutGuide
    
    contentView.addSubview(productView)
    productView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      productView.topAnchor.constraint(equalTo: contentViewGuide.topAnchor),
      productView.leadingAnchor.constraint(equalTo: contentViewGuide.leadingAnchor),
      productView.trailingAnchor.constraint(equalTo: contentViewGuide.trailingAnchor),
      productView.bottomAnchor.constraint(equalTo: contentViewGuide.bottomAnchor)
    ])
  }
}

