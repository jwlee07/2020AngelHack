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
  
  let mainVC = MainViewController()
  let chattingVC = ChattingViewController()
  let noticeVC = NoticeViewController()
  let myPageVC = MyPageViewController()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabBar()
    
  }
  
  // MARK: - SetTabBar
  
  func setTabBar() {
    view.backgroundColor = .systemBackground
    
    mainVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
    chattingVC.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "message.fill"), tag: 1)
    noticeVC.tabBarItem = UITabBarItem(title: "알림", image: UIImage(systemName: "info.circle.fill"), tag: 2)
    myPageVC.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person.circle.fill"), tag: 3)
    
    viewControllers = [mainVC, chattingVC, noticeVC, myPageVC]
  }
}
