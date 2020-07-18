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
  
  private let loginImageView = UIImageView()
  
  private let idTextfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "아이디를 입력해주세요."
    return textfield
  }()
  
  private let passwordTextfield: UITextField = {
    let textfield = UITextField()
    textfield.isSecureTextEntry = true
    textfield.placeholder = "비밀번호를 입력해주세요."
    return textfield
  }()
  
  private let idUnderLine: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray5
    return view
  }()
  
  private let passwordUnderLine: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray5
    return view
  }()
  
  private let idCancelButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
    button.tintColor = .systemGray2
    button.tag = 0
    return button
  }()
  
  private let passwordCancelButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
    button.tintColor = .systemGray2
    button.tag = 1
    return button
  }()
  
  private let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("로그인", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1)
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    return button
  }()
  
  private let lookAroundView: UIView = {
    let view = UIView()
    return view
  }()
  
  private let lookAroundButton: UIButton = {
    let button = UIButton()
    button.setTitle("구경해보실래요 ?", for: .normal)
    button.setTitleColor(.systemGray2, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    return button
  }()
  
  private let idPwSearchView: UIView = {
    let view = UIView()
    return view
  }()
  
  private let idSearchButton: UIButton = {
    let button = UIButton()
    button.setTitle("회원가입", for: .normal)
    button.setTitleColor(.systemGray2, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    return button
  }()
  
  private let passwordSearchButton: UIButton = {
    let button = UIButton()
    button.setTitle("비밀번호 찾기", for: .normal)
    button.setTitleColor(.systemGray2, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    return button
  }()
  
  private let signInButoon: UIButton = {
    let button = UIButton()
    button.setTitle("회원가입", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    return button
  }()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print ("LoginViewController")
    setUI()
    setTextfield()
  }
  
  // MARK: - Setup Textfield
  
  private func setTextfield() {
    idTextfield.delegate = self
    passwordTextfield.delegate = self
  }
  
  // MARK: - setUp Layout
  
  private func setUI() {
    
    view.backgroundColor = .systemBackground
    
    DeviceSize.width = view.frame.width
    DeviceSize.height = view.frame.height
    
    let guide = view.safeAreaLayoutGuide
    let viewHeight = view.frame.height
    
    let underLineHeight: CGFloat = 2
    let itemHeight: CGFloat = 50
    let searchViewPadding: CGFloat = 75
    let padding: CGFloat = 20
    let margin: CGFloat = 10
    let minMargin: CGFloat = 5
    
    [loginImageView, idTextfield, idUnderLine, passwordTextfield, passwordUnderLine, loginButton, lookAroundView, idPwSearchView, signInButoon].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: padding).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -padding).isActive = true
    }
    
    NSLayoutConstraint.activate([
      loginImageView.topAnchor.constraint(equalTo: guide.topAnchor),
      loginImageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      loginImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      idTextfield.topAnchor.constraint(equalTo: guide.topAnchor, constant: viewHeight / 4),
      idTextfield.heightAnchor.constraint(equalToConstant: itemHeight),
      
      idUnderLine.topAnchor.constraint(equalTo: idTextfield.safeAreaLayoutGuide.bottomAnchor),
      idUnderLine.heightAnchor.constraint(equalToConstant: underLineHeight),
      
      passwordTextfield.topAnchor.constraint(equalTo: idTextfield.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      passwordTextfield.heightAnchor.constraint(equalToConstant: itemHeight),
      
      passwordUnderLine.topAnchor.constraint(equalTo: passwordTextfield.safeAreaLayoutGuide.bottomAnchor),
      passwordUnderLine.heightAnchor.constraint(equalToConstant: underLineHeight),
      
      loginButton.topAnchor.constraint(equalTo: passwordUnderLine.safeAreaLayoutGuide.bottomAnchor, constant: margin + minMargin),
      loginButton.heightAnchor.constraint(equalToConstant: itemHeight),
      
      idPwSearchView.topAnchor.constraint(equalTo: loginButton.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      idPwSearchView.heightAnchor.constraint(equalToConstant: itemHeight),
      
      lookAroundView.topAnchor.constraint(equalTo: idPwSearchView.safeAreaLayoutGuide.bottomAnchor),
      lookAroundView.heightAnchor.constraint(equalToConstant: itemHeight),
      
      signInButoon.topAnchor.constraint(equalTo: lookAroundView.safeAreaLayoutGuide.bottomAnchor, constant: margin),
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
    
    [idCancelButton, passwordCancelButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.addTarget(self, action: #selector(didTapTextfieldCancleButton), for: .touchUpInside)
      $0.alpha = 0
      
      switch $0 {
      case idCancelButton:
        idTextfield.addSubview($0)
        $0.topAnchor.constraint(equalTo: idTextfield.topAnchor).isActive = true
        $0.bottomAnchor.constraint(equalTo: idTextfield.bottomAnchor).isActive = true
        $0.trailingAnchor.constraint(equalTo: idTextfield.trailingAnchor).isActive = true
      case passwordCancelButton:
        passwordTextfield.addSubview($0)
        $0.topAnchor.constraint(equalTo: passwordTextfield.topAnchor).isActive = true
        $0.bottomAnchor.constraint(equalTo: passwordTextfield.bottomAnchor).isActive = true
        $0.trailingAnchor.constraint(equalTo: passwordTextfield.trailingAnchor).isActive = true
      default:
        break
      }
    }
  }
  
  // MARK: - Action Button
  
  @objc func didTapLoginButton(_ sender: UIButton) {
    let mainTabBarVC = MainTabBarController()
    mainTabBarVC.modalPresentationStyle = .fullScreen
    mainTabBarVC.view.backgroundColor = .systemBackground
    present(mainTabBarVC, animated: true)
  }
  
  @objc func didTapTextfieldCancleButton(_ sender: UIButton){
    switch sender {
    case idCancelButton:
      print ("idCancelButton")
      idTextfield.text = ""
    case passwordCancelButton:
      print ("passwordCancelButton")
      passwordTextfield.text = ""
    default:
      break
    }
  }
}


// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    switch textField {
    case idTextfield:
      idUnderLine.backgroundColor = .systemGray
      passwordUnderLine.backgroundColor = .systemGray5
    case passwordTextfield:
      idUnderLine.backgroundColor = .systemGray5
      passwordUnderLine.backgroundColor = .systemGray
    default:
      break
    }
    return true
  }
  
  func textFieldDidChangeSelection(_ textField: UITextField) {
    switch textField {
    case idTextfield:
      idCancelButton.alpha = 1
    case passwordTextfield:
      passwordCancelButton.alpha = 1
    default:
      break
    }
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    switch textField {
    case idTextfield:
      idCancelButton.alpha = 0
    case passwordTextfield:
      passwordCancelButton.alpha = 0
    default:
      break
    }

  }
}
