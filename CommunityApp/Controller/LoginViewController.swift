//
//  File.swift
//  CommunityApp
//
//  Created by 전성진 on 6/25/24.
//

import UIKit
import SnapKit
import FirebaseAuth
import FirebaseCore
class LoginViewController: UIViewController {
    
    let mainLoginView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let mainLoginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "로그인"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: CGFloat(30), weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let idField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        // Placeholder 색상 바꾸는법
        textField.attributedPlaceholder = NSAttributedString(
            string: "아이디를 입력해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return textField
    }()
    
    let pwdField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호를 입력해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    let joinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Join", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(mainLoginView)
        mainLoginView.addSubview(mainLoginStackView)
        mainLoginStackView.addArrangedSubview(loginLabel)
        mainLoginStackView.addArrangedSubview(idField)
        mainLoginStackView.addArrangedSubview(pwdField)
        mainLoginStackView.addArrangedSubview(loginButton)
        mainLoginStackView.addArrangedSubview(joinButton)
        
        mainLoginView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0))
            $0.size.equalTo(CGSize(width: 300, height: 250))
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainLoginStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(0)
        }
        
        loginButton.addTarget(self, action: #selector(loginButtonTap(_:)), for: .touchDown)
        joinButton.addTarget(self, action: #selector(joinButtonTap), for: .touchDown)
    }
    
    @objc
    func loginButtonTap(_ sender: UIButton) {
        if let id = idField.text, let pwd = pwdField.text {
            print("ID: \(id) PWD: \(pwd)")
            createUser(id, pwd)
        }
    }
    
    @objc
    func joinButtonTap() {
        let joinViewController = JoinViewController()
        self.navigationController?.pushViewController(joinViewController, animated: true)
    }
    
    func createUser(_ id: String, _ pwd: String) {
        Auth.auth().signIn(withEmail: id, password: pwd) { result, error in
            if let error = error {
                print(error)
            }
            if let result = result {
                print("성공")
                print(result)
            }
        }
    }
}
