//
//  MyPageTabBarController.swift
//  CommunityApp
//
//  Created by t2023-m0019 on 6/25/24.
//

import UIKit
class HomeTabBarController: UITabBarController {
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
    let home = tabBarNavigationController(unselectedImage: imageLiteral(resourceName: "home_unselected"), selectedImage: imageLiteral(resourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
    let notification = tabBarNavigationController(unselectedImage: imageLiteral(resourceName: "like_unselected"), selectedImage: imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())
    let imageSelection = tabBarNavigationController(unselectedImage: imageLiteral(resourceName: "plus_unselected"), selectedImage: imageLiteral(resourceName: "add2"), rootViewController: ImageSelectionController())
    let search = tabBarNavigationController(unselectedImage: imageLiteral(resourceName: "search_unselected"), selectedImage: imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
    let profile = tabBarNavigationController(unselectedImage: imageLiteral(resourceName: "profile_unselected"), selectedImage: imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController())
    viewControllers = [feed, notification, imageSelection, search, profile]
  }
  func tabBarNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
    let nav = UINavigationController(rootViewController: rootViewController)
    nav.tabBarItem.image = unselectedImage
    nav.tabBarItem.selectedImage = selectedImage
    nav.navigationBar.tintColor = .black
    return nav
  }
}
