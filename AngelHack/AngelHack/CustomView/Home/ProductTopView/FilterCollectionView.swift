//
//  FilterCollectionView.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/17.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FilterCollectionView: UIView {
  // MARK: - Properties
  lazy private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  private let layout = UICollectionViewFlowLayout()
  private let filterNames: [String] = ["최신순", "가격순", "마감일순", "카테고리별", "추가하기", "블라블라블라", "블라"]
  private let moreBtn = UIButton()
  
  // MARK: - View LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Layout
  private func setUI() {
    addSubview(collectionView)
    addSubview(moreBtn)
    
    moreBtn.translatesAutoresizingMaskIntoConstraints = false
    moreBtn.setImage(UIImage(named: "더보기버튼"), for: .normal)
    moreBtn.adjustsImageWhenHighlighted = false
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    layout.scrollDirection = .horizontal
    
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .white
    collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: "FilterCell")
  }
  
  private func setLayout() {
    backgroundColor = .red
    NSLayoutConstraint.activate([
      moreBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
      moreBtn.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension
extension FilterCollectionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return filterNames.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCollectionViewCell
    
    cell.filterBtn.setTitle(filterNames[indexPath.item], for: .normal)
    if indexPath.item == 0 {
      cell.filterBtn.setTitleColor(UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1), for: .normal)
      cell.filterBtn.layer.borderColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1).cgColor
    }
    
    return cell
  }
}

extension FilterCollectionView: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let btn = UIButton()
    btn.setTitle(filterNames[indexPath.item], for: .normal)
    let size = (filterNames[indexPath.item] as NSString).size(withAttributes: [NSAttributedString.Key.font : btn.titleLabel!.font as Any]).width

    return CGSize(width: size + 15, height: 24)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
    return 8
  }
}


