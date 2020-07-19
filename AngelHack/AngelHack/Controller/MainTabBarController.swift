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
  let NoticeVC = UINavigationController (rootViewController: NoticeViewController())
  let naviMyPageVC = UINavigationController (rootViewController: MyPageViewController())
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabBar()
    
  }
  
  // MARK: - SetTabBar
  
  func setTabBar() {
    view.backgroundColor = .systemBackground
    
    naviMainVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "홈_1"), tag: 0)
    naviChattingVC.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(named: "채팅_1"), tag: 1)
    NoticeVC.tabBarItem = UITabBarItem(title: "알림", image: UIImage(named: "알림_1"), tag: 2)
    naviMyPageVC.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(named: "마이페이지_1"), tag: 2)
    
    viewControllers = [naviMainVC, naviChattingVC, NoticeVC, naviMyPageVC]
    
    UITabBar.appearance().tintColor = UIColor(red: 0, green: 0.698, blue: 0.525, alpha: 1)
  }
}

