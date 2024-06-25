//
//  MainTabBarController.swift
//  CommunityApp
//
//  Created by t2023-m0019 on 6/25/24.
//

import UIKit
class MainTabBarController: UITabBarController {
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
    configureController()
  }
  //MARK: - Helpers
  func configureController() {
    view.backgroundColor = .blue
    tabBar.backgroundColor = .white
    let layout = UICollectionViewFlowLayout()
    let home = tabBarNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: HomeController())
    let board = tabBarNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_unselected"), rootViewController: BoardController())
    let chat = tabBarNavigationController(unselectedImage: #imageLiteral(resourceName: "speech-bubble"), selectedImage: #imageLiteral(resourceName: "speech-bubble"), rootViewController: ChatController())
    let mypage = tabBarNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: MypageController())
      viewControllers = [home, board,chat, mypage]
  }
  func tabBarNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
    let nav = UINavigationController(rootViewController: rootViewController)
    nav.tabBarItem.image = unselectedImage
    nav.tabBarItem.selectedImage = selectedImage
    nav.navigationBar.tintColor = .black
    return nav
  }
}
