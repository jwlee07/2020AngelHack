//
//  SellerCategoryListTableViewCell.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SellerCategoryListTableViewCell: UITableViewCell {
  
  // MARK: - Property
  
  let categoryListImageView = UIImageView()
  let categoryListLabel = UILabel()
  static let identifier = "SellerCategoryListTableViewCell"
  
  
  // MARK: - init View
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    
  }
  
  // MARK: - SetUp LayOut
  
  func setUI() {
    
    let imageMargin: CGFloat = 25
    let imageSize: CGFloat = 22
    let labelMargin: CGFloat = 14
    
    [categoryListImageView, categoryListLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      categoryListImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: imageMargin),
      categoryListImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      categoryListImageView.widthAnchor.constraint(equalToConstant: imageSize),
      categoryListImageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      categoryListLabel.leadingAnchor.constraint(equalTo: categoryListImageView.trailingAnchor, constant: labelMargin),
      categoryListLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }
}
