 //
 //  ProductResidentViewController.swift
 //  AngelHack
 //
 //  Created by 이진욱 on 2020/07/17.
 //  Copyright © 2020 jwlee. All rights reserved.
 //
 
 import UIKit
 
 class ProductResidentViewController: UIViewController {
  // MARK: - Property
  
  let productResidentTopView = ProductResidentTopView()
  let productResidentCategorieView = ProductResidentCategorieView()
  let productResidentDetailExplanaView = ProductResidentDetailExplanaView()
  
  
  let productResidentTableView = UITableView()
  lazy var productResidentViewArr = [productResidentTopView, productResidentCategorieView, productResidentDetailExplanaView]
  
  let symbolSize = UIImage.SymbolConfiguration(pointSize: 24)
  
  lazy var dismissButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.left", withConfiguration: symbolSize), for: .normal)
    button.tintColor = .darkGray
    button.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
    return button
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "상품 등록하기"
    return label
  }()
  
  let productResidentCompleteButton: UIButton = {
    let button = UIButton()
    button.setTitle("작성 완료", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1)
    button.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
    return button
  }()
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTableView()
    setUI()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    tabBarController?.tabBar.isHidden = false
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    productResidentTableView.reloadData()
    tabBarController?.tabBar.isHidden = true
  }
  // MARK: - SetUp Layout
  
  func setTableView() {
    productResidentCategorieView.delegate = self
    productResidentTableView.allowsSelection = false
    productResidentTableView.dataSource = self
    productResidentTableView.register(ProductResidentViewCell.self, forCellReuseIdentifier: ProductResidentViewCell.identifier)
  }
  
  func setUI() {
    view.backgroundColor = .systemBackground
    
    let guide = view.safeAreaLayoutGuide
    let buttonMargin: CGFloat = 20
    let margin: CGFloat = 30
    let topMargin: CGFloat = 100
    let buttonHeight: CGFloat = 72
    
    [dismissButton, titleLabel, productResidentTableView, productResidentCompleteButton].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      dismissButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin),
      dismissButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: buttonMargin),
      
      titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin),
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      productResidentTableView.topAnchor.constraint(equalTo: guide.topAnchor, constant: topMargin),
      productResidentTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      productResidentTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      productResidentTableView.bottomAnchor.constraint(equalTo: productResidentCompleteButton.topAnchor),
      
      productResidentCompleteButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      productResidentCompleteButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      productResidentCompleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      productResidentCompleteButton.heightAnchor.constraint(equalToConstant: buttonHeight)
    ])
  }
  
  // MARK: - Action Button
  @objc func didTapDismissButton(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    self.view.endEditing(true)
  }
 }
 
 // MARK: - UITableViewDataSource
 
 extension ProductResidentViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    productResidentViewArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let residentCell = productResidentTableView.dequeueReusableCell(withIdentifier: ProductResidentViewCell.identifier, for: indexPath) as! ProductResidentViewCell
    residentCell.productView = productResidentViewArr[indexPath.row]
    switch indexPath.row {
    case 0:
      productResidentTableView.rowHeight = 200
    case 1:
      productResidentTableView.rowHeight = 250
    case 2:
      productResidentTableView.rowHeight = 300
    default:
      break
    }
    return residentCell
  }
 }
 
 // MARK: - ProductResidentCategorieDelegate
 
 extension ProductResidentViewController: ProductResidentCategorieDelegate {
  func presetCategoryAgriculturaView() {
    let categorySelecterListVC = CategorySelecterListViewController()
    categorySelecterListVC.modalPresentationStyle = .overFullScreen
    present(categorySelecterListVC, animated: true)
  }
 }
 
