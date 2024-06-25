//
//  ViewController.swift
//  CommunityApp
//
//  Created by 전성진 on 6/23/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }
    
    func configure() {
        view.backgroundColor = .white
        
        let mainTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "게임 커뮤니티"
            label.textColor = .black
            
            return label
        }()
        
        let mainJoinButton: UIButton = {
            let button = UIButton()
            button.setTitle("회원가입", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            return button
        }()
        
        let mainLoginButton: UIButton = {
            let button = UIButton()
            button.setTitle("로그인", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            return button
        }()
        
        view.addSubview(mainTitleLabel)
        view.addSubview(mainJoinButton)
        view.addSubview(mainLoginButton)
        
        mainTitleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        mainJoinButton.snp.makeConstraints {
            $0.centerX.equalTo(mainTitleLabel.snp.centerX)
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(30)
        }
        mainJoinButton.addTarget(self, action: #selector(joinButton), for: .touchDown)
        
        mainLoginButton.snp.makeConstraints {
            $0.centerX.equalTo(mainJoinButton.snp.centerX)
            $0.top.equalTo(mainJoinButton.snp.bottom).offset(30)
        }
        mainLoginButton.addTarget(self, action: #selector(loginButton), for: .touchDown)
    }
    
    @objc
    func joinButton() {
        // 이동할 뷰 컨트롤러 생성
        let joinViewController = JoinViewController()
//        joinViewController.title = "회원가입"
        
        // 뷰 컨트롤러 이동
        navigationController?.pushViewController(joinViewController, animated: true)
    }
    
    @objc
    func loginButton() {
        // 이동할 뷰 컨트롤러 생성
        let loginViewController = LoginViewController()
        
        // 뷰 컨트롤러 이동
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
