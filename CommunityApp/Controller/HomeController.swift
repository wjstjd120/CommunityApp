//
//  HomeController.swift
//  CommunityApp
//
//  Created by t2023-m0019 on 6/25/24.
//

import UIKit
import SnapKit

class HomeController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        configureLoginButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // #colorLiteral()
    }
    
    private func configureLoginButton() {
        let loginButton = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(loginButtonTapped))
        navigationItem.rightBarButtonItem = loginButton
    }
    
    @objc
    func loginButtonTapped() {
        let lgn = LoginViewController()
        self.navigationController?.pushViewController(lgn, animated: true)
    }
}
