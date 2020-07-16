//
//  DetailTestView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/15.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DetailTestView: UIView {
   // MARK: - Property
    
    var detailScrollView = UIScrollView()
    var productImageArr = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemIndigo, UIColor.systemPink]
    var productImageViewArr = [UIImageView]()
    
    // MARK: - init View
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setUI()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Layout
    
    func setUI() {
      
      let selfGuide = self.safeAreaLayoutGuide
      self.addSubview(detailScrollView)
      detailScrollView.backgroundColor = .systemBackground
      detailScrollView.isPagingEnabled = true
      
      detailScrollView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        detailScrollView.topAnchor.constraint(equalTo: selfGuide.topAnchor),
        detailScrollView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
        detailScrollView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
        detailScrollView.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor)
      ])
      
      for product in productImageArr {
        
        let detailImageView = UIImageView()
        detailImageView.backgroundColor = product
        productImageViewArr.append(detailImageView)
        detailScrollView.addSubview(detailImageView)
        
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
          detailImageView.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor),
          detailImageView.trailingAnchor.constraint(equalTo: detailScrollView.trailingAnchor),
          detailImageView.heightAnchor.constraint(equalTo: detailScrollView.heightAnchor),
          detailImageView.widthAnchor.constraint(equalTo: detailScrollView.widthAnchor)
        ])
      }
      
      for (index, value) in productImageViewArr.enumerated() {
        switch index {
        case 0:
          value.topAnchor.constraint(equalTo: detailScrollView.topAnchor).isActive = true
        case productImageViewArr.count - 1:
          value.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor).isActive = true
          fallthrough
        default:
          value.topAnchor.constraint(equalTo: productImageViewArr[index - 1].bottomAnchor).isActive = true
        }
      }
    }
}
