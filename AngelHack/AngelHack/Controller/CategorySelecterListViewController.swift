//
//  CategorySelecterListViewController.swift
//  AngelHack
//
//  Created by 성단빈 on 2020/07/19.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CategorySelecterListViewController: UIViewController {
  // MARK: - Properties
//  private let containerView = UIView()
  private let layout = UICollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  private let categoryImages = ["감자:고구마", "과일", "당근:뿌리채소", "오이:고추:열매채소", "양파:마늘:파", "배추:무:김장채소", "상추:꺳잎:쌈채소", "새송이:버섯류", "기타"]
  
  private let categoryNames = ["감자/고구마", "과일", "당근/뿌리채소", "오이/고추/열매채소", "양파/마늘/파", "배추/무/김장채소", "상추/꺳잎/쌈채소", "새송이/버섯류", "기타"]
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setLayout()
  }
  
  // MARK: - Layout
  private func setUI() {
    view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
    view.addSubview(collectionView)
    
    collectionView.backgroundColor = .systemBackground
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(CategorySelecterListCell.self, forCellWithReuseIdentifier: "Cell")
    collectionView.layer.cornerRadius = 10
    collectionView.clipsToBounds = true
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 235),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -235)
    ])
  }
  
  // MARK: - Action Handler
}

// MARK: - Extension

extension CategorySelecterListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return categoryImages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategorySelecterListCell
    
    cell.titleImageView.image = UIImage(named: categoryImages[indexPath.item])
    cell.titleLabel.text = categoryNames[indexPath.item]
    
    return cell
  }

}

extension CategorySelecterListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let itemSpasing: CGFloat = 8
    let itemCount: CGFloat = 3
//    let inset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    
    let contentHeight = collectionView.frame.height - (itemSpasing * (itemCount - 1))
    let contentWidth = collectionView.frame.width - (itemSpasing * (itemCount - 1))
    let cellWidth = contentWidth / itemCount
    let cellHeight = contentHeight / itemCount
    return CGSize(width: cellWidth - 10, height: cellHeight - 17)
  }
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//
//    return 8
//  }
}
