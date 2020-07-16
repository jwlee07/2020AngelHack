//
//  DetailCustomView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/14.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DetailProductImageCustomView: UIView {
  
  // MARK: - Property
  
  var detailScrollView = UIScrollView()
  var productImageArr = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemIndigo, UIColor.systemPink]
  var productImageViewArr = [UIImageView]()
  let productLikeButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "heart"), for: .normal)
    button.tintColor = .systemGray
    return button
  }()
  let pageControl = UIPageControl()
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setUpProperty()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Layout
  
  private func setUpProperty() {
    
    detailScrollView.backgroundColor = .systemBackground
    detailScrollView.isPagingEnabled = true
    detailScrollView.delegate = self
    
    pageControl.numberOfPages = productImageArr.count
    pageControl.currentPage = 0
    pageControl.pageIndicatorTintColor = .lightGray
    pageControl.currentPageIndicatorTintColor = .white
    pageControl.addTarget(self, action: #selector(handlePageControl), for: .valueChanged)
  }
  
  private func setUI() {
    
    let selfGuide = self.safeAreaLayoutGuide
    let margin: CGFloat = 10
    let buttonSize: CGFloat = 50
    
    
    [detailScrollView, productLikeButton, pageControl].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      detailScrollView.topAnchor.constraint(equalTo: selfGuide.topAnchor),
      detailScrollView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      detailScrollView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      detailScrollView.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor),
      
      productLikeButton.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor, constant: -margin),
      productLikeButton.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor, constant: -margin),
      productLikeButton.widthAnchor.constraint(equalToConstant: buttonSize),
      productLikeButton.heightAnchor.constraint(equalToConstant: buttonSize),
      
      pageControl.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      pageControl.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      pageControl.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor, constant: -margin)
    ])
    
    for product in productImageArr {
      
      let detailImageView = UIImageView()
      detailImageView.backgroundColor = product
      productImageViewArr.append(detailImageView)
      detailScrollView.addSubview(detailImageView)
      
      detailImageView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        detailImageView.topAnchor.constraint(equalTo: detailScrollView.topAnchor),
        detailImageView.bottomAnchor.constraint(equalTo: detailScrollView.bottomAnchor),
        detailImageView.heightAnchor.constraint(equalTo: detailScrollView.heightAnchor),
        detailImageView.widthAnchor.constraint(equalTo: detailScrollView.widthAnchor)
      ])
    }
    
    for (index, value) in productImageViewArr.enumerated() {
      switch index {
      case 0:
        value.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor).isActive = true
      case productImageViewArr.count - 1:
        value.trailingAnchor.constraint(equalTo: detailScrollView.trailingAnchor).isActive = true
        fallthrough
      default:
        value.leadingAnchor.constraint(equalTo: productImageViewArr[index - 1].trailingAnchor).isActive = true
      }
    }
  }
  
  @objc private func handlePageControl(_ sender: UIPageControl) {
    let moveX = CGFloat(pageControl.currentPage) * DeviceSize.width
    detailScrollView.setContentOffset(CGPoint(x: moveX, y: 0), animated: true)
  }
}

// MARK: -

extension DetailProductImageCustomView: UIScrollViewDelegate {
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.width)
    pageControl.currentPage = Int(pageNumber)
  }
}
