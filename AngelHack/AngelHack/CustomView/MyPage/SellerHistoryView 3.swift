//
//  SellerHistoryView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SellerHistoryView: UIView {
  // MARK: - Property
  
  lazy var sellBreakdownImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "판매내역")
    return imageView
  }()
  
  lazy var buyBreakdownImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "구매내역")
    return imageView
  }()
  
  lazy var likeBreakdownImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "찜한목록")
    return imageView
  }()
  
  private let sellLabel: UILabel = {
    let label = UILabel()
    label.text = "판매내역"
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    return label
  }()
  
  private let buyLabel: UILabel = {
    let label = UILabel()
    label.text = "구매내역"
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    return label
  }()
  
   private let likeLabel: UILabel = {
    let label = UILabel()
    label.text = "찜한목록"
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    return label
  }()
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUP Layout
  
  private func setUI() {
    
    let imageSize: CGFloat = 34
    let imageMargin: CGFloat = 15
    let titleMargin: CGFloat = 10
    let imagePadding: CGFloat = 80
    
    [sellBreakdownImageView, buyBreakdownImageView, likeBreakdownImageView, sellLabel, buyLabel, likeLabel].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      buyBreakdownImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      buyBreakdownImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -imageMargin),
      buyBreakdownImageView.widthAnchor.constraint(equalToConstant: imageSize),
      buyBreakdownImageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      sellBreakdownImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -imageMargin),
      sellBreakdownImageView.trailingAnchor.constraint(equalTo: buyBreakdownImageView.leadingAnchor, constant: -imagePadding),
      sellBreakdownImageView.widthAnchor.constraint(equalToConstant: imageSize),
      sellBreakdownImageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      likeBreakdownImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -imageMargin),
      likeBreakdownImageView.leadingAnchor.constraint(equalTo: buyBreakdownImageView.trailingAnchor, constant: imagePadding),
      likeBreakdownImageView.widthAnchor.constraint(equalToConstant: imageSize),
      likeBreakdownImageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      buyLabel.topAnchor.constraint(equalTo: buyBreakdownImageView.bottomAnchor, constant: titleMargin),
      buyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      
      sellLabel.topAnchor.constraint(equalTo: sellBreakdownImageView.bottomAnchor, constant: titleMargin),
      sellLabel.centerXAnchor.constraint(equalTo: sellBreakdownImageView.centerXAnchor),
      
      likeLabel.topAnchor.constraint(equalTo: likeBreakdownImageView.bottomAnchor, constant: titleMargin),
      likeLabel.centerXAnchor.constraint(equalTo: likeBreakdownImageView.centerXAnchor),
    ])
  }
}
