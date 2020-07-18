//
//  DetailCustomView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/14.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductDetailImageCustomView: UIView {
  
  // MARK: - Property
  
  var detailScrollView = UIScrollView()
  var productImageArr = ["못생긴감자_1", "못생긴감자_2", "못생긴감자_3"].compactMap {
    UIImage.init(named: $0)
  }
  var productImageViewArr = [UIImageView]()
  let pageControl = UIPageControl()
  
  let symbolSize = UIImage.SymbolConfiguration(pointSize: 24)
  
  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.left", withConfiguration: symbolSize), for: .normal)
    button.tintColor = .white
    return button
  }()
  
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

    [detailScrollView, pageControl, dismissButton].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      detailScrollView.topAnchor.constraint(equalTo: self.topAnchor),
      detailScrollView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      detailScrollView.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      detailScrollView.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor),
      
      pageControl.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor),
      pageControl.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor),
      pageControl.bottomAnchor.constraint(equalTo: selfGuide.bottomAnchor, constant: -margin),
      
      dismissButton.topAnchor.constraint(equalTo: selfGuide.topAnchor, constant: margin),
      dismissButton.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor, constant: margin)
    ])
    
    for product in productImageArr {
      
      let detailImageView = UIImageView()
      detailImageView.image = product
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

extension ProductDetailImageCustomView: UIScrollViewDelegate {
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.width)
    pageControl.currentPage = Int(pageNumber)
  }
}
