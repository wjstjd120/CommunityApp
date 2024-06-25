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
class JoinViewController: UIViewController {
    
    let mainJoinView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let mainJoinStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    let joinLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "회원가입"
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
    
    let joinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Join", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(mainJoinView)
        mainJoinView.addSubview(mainJoinStackView)
        mainJoinStackView.addArrangedSubview(joinLabel)
        mainJoinStackView.addArrangedSubview(idField)
        mainJoinStackView.addArrangedSubview(pwdField)
        mainJoinStackView.addArrangedSubview(joinButton)
        
        mainJoinView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0))
            $0.size.equalTo(CGSize(width: 300, height: 210))
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainJoinStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(0)
        }
        
        joinButton.addTarget(self, action: #selector(joinButtonTap(_:)), for: .touchDown)
    }
    
    @objc
    func joinButtonTap(_ sender: UIButton) {
        if let id = idField.text, let pwd = pwdField.text {
            print("ID: \(id) PWD: \(pwd)")
            createUser(id, pwd)
        }
    }
    
    func createUser(_ id: String, _ pwd: String) {
        Auth.auth().createUser(withEmail: id, password: pwd) { result, error in
            if let error = error {
                print(error)
            }
            if let result = result {
                print(result)
            }
        }
    }
}
