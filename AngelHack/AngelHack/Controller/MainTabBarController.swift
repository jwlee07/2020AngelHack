//
//  MainTabBarController.swift
//  AngelHack
//
//  Created by 이진욱 on 2020/07/12.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
  // MARK: - Property
  
  let naviMainVC = UINavigationController(rootViewController: MainViewController())
  let naviChattingVC = UINavigationController (rootViewController: ChattingViewController())
  let naviMyPageVC = UINavigationController (rootViewController: MyPageViewController())
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabBar()
    
  }
  
  // MARK: - SetTabBar
  
  func setTabBar() {
    view.backgroundColor = .systemBackground
    
    naviMainVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "홈"), tag: 0)
    naviMyPageVC.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "마이페이지"), tag: 2)
    
    viewControllers = [naviMainVC, naviMyPageVC]
  }
}
