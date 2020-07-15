//
//  LoginViewController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  // MARK: - Property
  
  private let idTextfield: UITextField = {
    let textfield = UITextField()
    textfield.borderStyle = .roundedRect
    textfield.backgroundColor = .systemGray2
    textfield.layer.cornerRadius = 10
    textfield.clipsToBounds = true
    textfield.placeholder = "✉️ 당신의 아이디는 ?"
    return textfield
  }()
  
  private let passwordTextfield: UITextField = {
    let textfield = UITextField()
    textfield.borderStyle = .roundedRect
    textfield.backgroundColor = .systemGray2
    textfield.layer.cornerRadius = 10
    textfield.clipsToBounds = true
    textfield.isSecureTextEntry = true
    textfield.placeholder = "🔒 당신의 비밀번호는 ?"
    textfield.leftViewMode = .always
    return textfield
  }()
  
  private let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("로그인", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemGray2
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    return button
  }()
  
  private let lookAroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray
    return view
  }()
  
  private let lookAroundButton: UIButton = {
    let button = UIButton()
    button.setTitle("구경해보실래요 ?", for: .normal)
    button.setTitleColor(.white, for: .normal)
    return button
  }()
  
  private let idPwSearchView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray
    return view
  }()
  
  private let idSearchButton: UIButton = {
    let button = UIButton()
    button.setTitle("아이디 찾기", for: .normal)
    button.setTitleColor(.systemGray2, for: .normal)
    return button
  }()
  
  private let passwordSearchButton: UIButton = {
    let button = UIButton()
    button.setTitle("비밀번호 찾기", for: .normal)
    button.setTitleColor(.systemGray2, for: .normal)
    return button
  }()
  
  private let signInButoon: UIButton = {
    let button = UIButton()
    button.setTitle("회원가입", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemGray2
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    return button
  }()
  
  private let textFieldInImage = TextFieldInImageView()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print ("LoginViewController")
    setUI()
  }
  
  // MARK: - setUp Layout
    
  private func setUI() {
    
    view.backgroundColor = .systemGray
        
    DeviceSize.width = view.frame.width
    DeviceSize.height = view.frame.height
    
    let guide = view.safeAreaLayoutGuide
    let viewHeight = view.frame.height
    
    let itemHeight: CGFloat = 50
    let searchViewPadding: CGFloat = 75
    let padding: CGFloat = 20
    let margin: CGFloat = 10
    
    [idTextfield, passwordTextfield, loginButton, lookAroundView, idPwSearchView, signInButoon].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding).isActive = true
    }
    
    NSLayoutConstraint.activate([
      idTextfield.topAnchor.constraint(equalTo: guide.topAnchor, constant: viewHeight / 4),
      idTextfield.heightAnchor.constraint(equalToConstant: itemHeight),
      
      passwordTextfield.topAnchor.constraint(equalTo: idTextfield.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      passwordTextfield.heightAnchor.constraint(equalToConstant: itemHeight),
      
      loginButton.topAnchor.constraint(equalTo: passwordTextfield.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      loginButton.heightAnchor.constraint(equalToConstant: itemHeight),
      
      lookAroundView.topAnchor.constraint(equalTo: loginButton.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      lookAroundView.heightAnchor.constraint(equalToConstant: itemHeight),
      
      idPwSearchView.topAnchor.constraint(equalTo: lookAroundView.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      idPwSearchView.heightAnchor.constraint(equalToConstant: itemHeight),
      
      signInButoon.topAnchor.constraint(equalTo: idPwSearchView.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      signInButoon.heightAnchor.constraint(equalToConstant: itemHeight)
    ])
    
    lookAroundView.addSubview(lookAroundButton)
    lookAroundButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      lookAroundButton.topAnchor.constraint(equalTo: lookAroundView.safeAreaLayoutGuide.topAnchor),
      lookAroundButton.bottomAnchor.constraint(equalTo: lookAroundView.safeAreaLayoutGuide.bottomAnchor),
      lookAroundButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    [idSearchButton, passwordSearchButton].forEach {
      idPwSearchView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.topAnchor.constraint(equalTo: idPwSearchView.safeAreaLayoutGuide.topAnchor).isActive = true
      $0.bottomAnchor.constraint(equalTo: idPwSearchView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      idSearchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -searchViewPadding),
      passwordSearchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: searchViewPadding)
    ])
  }
  
  // MARK: - Action Button
  
  @objc func didTapLoginButton(_ sender: UIButton) {
    let mainTabBarVC = MainTabBarController()
    mainTabBarVC.modalPresentationStyle = .fullScreen
    mainTabBarVC.view.backgroundColor = .systemBackground
    present(mainTabBarVC, animated: true)
  }
  
}
