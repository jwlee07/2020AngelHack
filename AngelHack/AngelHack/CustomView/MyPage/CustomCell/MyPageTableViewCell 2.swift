
//  DetailProductTableViewCell.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MyPageTableViewCell: UITableViewCell {
  
  // MARK: - Property
  
  var myPageView = UIView()
  static let identifier = "MyPageTableViewCell"

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
    
    contentView.addSubview(myPageView)
    myPageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      myPageView.topAnchor.constraint(equalTo: contentViewGuide.topAnchor),
      myPageView.leadingAnchor.constraint(equalTo: contentViewGuide.leadingAnchor),
      myPageView.trailingAnchor.constraint(equalTo: contentViewGuide.trailingAnchor),
      myPageView.bottomAnchor.constraint(equalTo: contentViewGuide.bottomAnchor)
    ])
  }
}

