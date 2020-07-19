//
//  SellerProfileView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SellerProfileView: UIView {
  
  // MARK: - Property
  
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "진욱이")
    return imageView
  }()
  
  lazy var imageAddView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "프로필사진_수정아이콘")
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "멋쟁이 농부"
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
    return label
  }()
  
  private let mapTitle: UILabel = {
    let label = UILabel()
    label.text = "드 넓은 농장"
    label.textColor = UIColor(red: 0.278, green: 0.278, blue: 0.278, alpha: 1)
    label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    return label
  }()
  
  lazy var profileCheckButton: UIButton = {
    let button = UIButton()
    button.setTitle("프로필 보기", for: .normal)
    button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
    button.setTitleColor(.systemGray, for: .normal)
    button.layer.cornerRadius = 5
    button.clipsToBounds = true
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.systemGray.cgColor
    return button
  }()
  
  
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp LayOut
  
  private func setUI() {
    
    let selfGuide = self.safeAreaLayoutGuide
    let margin: CGFloat = 10
    let titleMargin: CGFloat = 12
    let imageAddMargin: CGFloat = 15
    let imageSize: CGFloat = 50
    let imageAddSize: CGFloat = 16
    let buttonSize: CGFloat = 90
    
    [imageView, imageAddView, titleLabel, mapTitle, profileCheckButton].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      imageView.centerYAnchor.constraint(equalTo: selfGuide.centerYAnchor),
      imageView.leadingAnchor.constraint(equalTo: selfGuide.leadingAnchor, constant: margin),
      imageView.widthAnchor.constraint(equalToConstant: imageSize),
      imageView.heightAnchor.constraint(equalToConstant: imageSize),
      
      imageAddView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -imageAddMargin),
      imageAddView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -imageAddMargin),
      imageAddView.widthAnchor.constraint(equalToConstant: imageAddSize),
      imageAddView.heightAnchor.constraint(equalToConstant: imageAddSize),
      
      
      titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: margin),
      titleLabel.centerYAnchor.constraint(equalTo: selfGuide.centerYAnchor, constant: -titleMargin),
      
      mapTitle.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: margin),
      mapTitle.centerYAnchor.constraint(equalTo: selfGuide.centerYAnchor, constant: titleMargin),
      
      profileCheckButton.trailingAnchor.constraint(equalTo: selfGuide.trailingAnchor, constant: -margin),
      profileCheckButton.centerYAnchor.constraint(equalTo: selfGuide.centerYAnchor),
      profileCheckButton.widthAnchor.constraint(equalToConstant: buttonSize)
    ])
    imageView.layer.cornerRadius = 25
    imageView.clipsToBounds = true
  }
}
