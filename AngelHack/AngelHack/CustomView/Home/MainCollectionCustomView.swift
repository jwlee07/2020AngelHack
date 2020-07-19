//
//  MainCollectionCustomView.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol MainCollectionCustomViewDelegate: class {
  func nextView()
}

class MainCollectionCustomView: UIView {
  
  // MARK: - Property
  weak var delegate: MainCollectionCustomViewDelegate?
  let collectionViewLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
  var superViewWidth: CGFloat = 0
  var superViewHeight: CGFloat = 0
  
  let agriculturalListImageArr = ["못생긴감자_1", "고추_1", "참외_1", "토마토_1", "피망_1", "감자_1"].compactMap {
    UIImage.init(named: $0)
  }
  
  let agriculturalListTitleArr = ["A급 맛 자랑하는 감자", "너무 맛있는 고추에용", "싱싱한 참외 팝니다잉", "탱글탱글 토마토 입니다.", "여름엔 피망이죠 ㅎㅎ", "대한민국 1등 감자"]
  
  let agriculturalListUnitArr = ["5kg 10개", "3kg 50개", "10kg 5개", "7kg 8개", "10kg 20개", "10kg 50개"]
  let agriculturalListDeadLineArr = ["2020.07.15", "2020.07.18", "2020.07.24", "2020.07.30", "2020.08.02", "2020.08.15"]
  
    let agriculturalListPriceArr = ["15,000원", "10,000원", "20,000원", "7,000원", "20,000원", "25,000원"]
  
  // MARK: - View Init
  init(frame: CGRect, superViewWidth: CGFloat, superViewHeight: CGFloat) {
    super.init(frame: frame)
    self.superViewWidth = superViewWidth
    self.superViewHeight = superViewHeight
    
    setUI()
    setCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUp Layout
  
  func setCollectionView() {
    let itemSpasing: CGFloat = 11
    let lineSpasing: CGFloat = 16
    let itemCount:CGFloat = 2
    let sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
    
    collectionViewLayout.sectionInset = sectionInset
    collectionViewLayout.minimumLineSpacing = lineSpasing
    collectionViewLayout.minimumInteritemSpacing = itemSpasing
    print(collectionView.bounds.width)
    let contentWidth = superViewWidth - (itemSpasing * (itemCount - 1)) - (sectionInset.left + sectionInset.right)
    let cellWidth = contentWidth / itemCount
    collectionViewLayout.itemSize = CGSize(width: cellWidth, height: 330)
    
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Custom")
    
  }
  
  func setUI() {
    self.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: self.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
// MARK: - UICollectionViewDataSource

extension MainCollectionCustomView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return agriculturalListImageArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Custom", for: indexPath) as! MainCollectionViewCell
    
    cell.layer.borderWidth = 0.05
    cell.layer.borderColor = UIColor.black.cgColor
    cell.layer.cornerRadius = 10
    cell.productImageView.image = agriculturalListImageArr[indexPath.row]
    cell.titleLabel.text = agriculturalListTitleArr[indexPath.row]
    cell.unitLabel.text = agriculturalListUnitArr[indexPath.row]
    cell.lastDayLabel.text = agriculturalListDeadLineArr[indexPath.row]
    cell.priceLabel.text = agriculturalListPriceArr[indexPath.row]
    return cell
  }
}

extension MainCollectionCustomView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.nextView()
  }
}


