//
//  TextFieldInImageView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/13.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TextFieldInImageView: UIView {
  let imageView = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.tintColor = .systemGray
    imageView.image = UIImage(systemName: "magnifyingglass")
    
    NSLayoutConstraint.activate([
      imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

