//
//  HomeController.swift
//  CommunityApp
//
//  Created by t2023-m0019 on 6/25/24.
//

import UIKit
import SnapKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // #colorLiteral()
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("로그인", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    @objc func loginButtonTapped() {
        let lgn = LoginViewController()
        self.navigationController?.pushViewController(lgn, animated: true)
    }
}
