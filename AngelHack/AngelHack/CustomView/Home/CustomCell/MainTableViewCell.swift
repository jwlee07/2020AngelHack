//
//  MainTableViewCell.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
  
  // MARK: - Property
  
  let personImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "제목"
    return label
  }()
  
  let subLabel: UILabel = {
    let label = UILabel()
    label.text = "설명"
    return label
  }()
  
  // MARK: - init View
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    
  }
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
  }
  
  // MARK: - Setup Layout
  
  func setUI() {
    
    let padding: CGFloat = 10
    let subTitlePadding: CGFloat = 15
    let guide = contentView.safeAreaLayoutGuide
    let contentWidth = contentView.frame.width
    
    [personImageView, titleLabel, subLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      
      personImageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: padding),
      personImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding),
      personImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -contentWidth / 1.1),
      personImageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -padding),
      
      titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: padding),
      titleLabel.leadingAnchor.constraint(equalTo: personImageView.safeAreaLayoutGuide.trailingAnchor, constant: padding),
      
      subLabel.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.bottomAnchor, constant: subTitlePadding),
      subLabel.leadingAnchor.constraint(equalTo: personImageView.safeAreaLayoutGuide.trailingAnchor, constant: padding)
    ])
  }
}
