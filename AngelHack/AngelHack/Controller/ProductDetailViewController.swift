//
//  ProductDetailViewController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/14.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
  
  // MARK: - Property
  
  let detailTableVIew = UITableView()
  
  let productImageView = ProductDetailImageCustomView()
  let productInfoView = ProductInfoView()
  let productDetailReasonView = ProductDetailReasonView()
  let sellerOtherProductView = SellerOtherProductView()
  
  lazy var productViewArr = [productImageView, productInfoView, productDetailReasonView, sellerOtherProductView]
  
  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.left", withConfiguration: symbolSize), for: .normal)
    button.tintColor = .white
    button.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
    return button
  }()
  
  let supportView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1)
    return view
  }()
  
  let symbolSize = UIImage.SymbolConfiguration(pointSize: 24)
  
  lazy var likeButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "heart", withConfiguration: symbolSize), for: .normal)
    button.tintColor = .white
    return button
  }()
  
  let fenceView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  let priceLabel: UILabel = {
    let label = UILabel()
    label.text = "15,000원"
    label.textColor = .white
    label.shadowColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()
  
  let chattingInquiryButton: UIButton = {
    let button = UIButton()
    button.setTitle("채팅으로 문의하기", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.white.cgColor
    return button
  }()
  
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTableView()
    setUI()
    setSuppoertView()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    detailTableVIew.reloadData()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    productInfoView.sellerImageView.layer.cornerRadius = productInfoView.sellerImageView.frame.width / 2
    productInfoView.sellerImageView.clipsToBounds = true
    
  }
  
  // MARK: - SetupLayout
  
  private func setTableView() {
    detailTableVIew.dataSource = self
    detailTableVIew.allowsSelection = false
    detailTableVIew.register(DetailProductTableViewCell.self, forCellReuseIdentifier: "Custom")

  }

  private func setUI() {
    
    let guide = view.safeAreaLayoutGuide
    let buttonHeight: CGFloat = 50
    let margin: CGFloat = 10
    
    [detailTableVIew, supportView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      detailTableVIew.topAnchor.constraint(equalTo: view.topAnchor),
      detailTableVIew.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -buttonHeight),
      
      supportView.topAnchor.constraint(equalTo: detailTableVIew.bottomAnchor),
      supportView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    view.addSubview(dismissButton)
    dismissButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      dismissButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin),
      dismissButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: margin)
    ])
  }
  
  private func setSuppoertView() {
    
    let margin: CGFloat = 17
    let maxMargin: CGFloat = 30
    let minMargin: CGFloat = 15
    let fenceWidth: CGFloat = 2
    let viewWidth = view.frame.width
  
    [likeButton, fenceView, priceLabel, chattingInquiryButton].forEach {
      supportView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.topAnchor.constraint(equalTo: supportView.topAnchor, constant: minMargin).isActive = true
      $0.bottomAnchor.constraint(equalTo: supportView.bottomAnchor, constant: -minMargin).isActive = true
      $0.centerYAnchor.constraint(equalTo: supportView.centerYAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      likeButton.leadingAnchor.constraint(equalTo: supportView.leadingAnchor, constant: margin),
      
      fenceView.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: margin),
      fenceView.widthAnchor.constraint(equalToConstant: fenceWidth),
      
      priceLabel.leadingAnchor.constraint(equalTo: fenceView.trailingAnchor, constant: margin),
      
      chattingInquiryButton.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: maxMargin),
      chattingInquiryButton.widthAnchor.constraint(equalToConstant: viewWidth / 2.3)
    ])
  }
  
  // MARK: - Action Button
  @objc func didTapDismissButton(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
}

// MARK: - UITableViewDataSource

extension ProductDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    productViewArr.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let detailCell = detailTableVIew.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! DetailProductTableViewCell
    detailCell.productView = productViewArr[indexPath.row]
    
    switch indexPath.row {
    case 0:
      detailTableVIew.rowHeight = 350
    case 1:
      detailTableVIew.rowHeight = 225
    case 2:
      detailTableVIew.rowHeight = 250
    case 3:
      detailTableVIew.rowHeight = 250
    default:
      break
    }
    return detailCell
  }
}
