//
//  LaunchScreenViewController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/18.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {
  
  // MARK: - Property
  
  let logoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "B급장터_로고")
    return imageView
  }()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      let loginVC = LoginViewController()
      loginVC.modalPresentationStyle = .fullScreen
      self.present(loginVC, animated: true)
    }
  }
  
  // MARK: - SetUpLayout
  
  func setUI() {
    
    let imageWidth: CGFloat = 40
    let imageHeight: CGFloat = 70
    
    view.addSubview(logoImageView)
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      logoImageView.widthAnchor.constraint(equalToConstant: imageWidth),
      logoImageView.heightAnchor.constraint(equalToConstant: imageHeight)
    ])
  }
}
