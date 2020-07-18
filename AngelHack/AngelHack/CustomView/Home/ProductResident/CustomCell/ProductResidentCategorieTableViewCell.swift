//
//  ProductResidentCategorieTableViewCell.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/18.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductResidentCategorieTableViewCell: UITableViewCell {
  
  // MARK: - Property

  let categorieLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  let categorieImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  static let identifier = "CategorieTableViewCell"

  // MARK: - init View
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      setCellUI()

    }
  
  // MARK: - Setup Layout
  
  func setCellUI() {
    
    let guide = contentView.safeAreaLayoutGuide
    let margin: CGFloat = 15
    let imageMargin: CGFloat = 25
    let imageViewWidth: CGFloat = 15
    
    [categorieLabel, categorieImageView].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin).isActive = true
      $0.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -margin).isActive = true
    }
    NSLayoutConstraint.activate([
      categorieLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin),
      
      categorieImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -imageMargin),
      categorieImageView.widthAnchor.constraint(equalToConstant: imageViewWidth)
    ])
  }
}
