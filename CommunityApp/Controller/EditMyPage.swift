//
//  EditMyPage.swift
//  CommunityApp
//
//  Created by t2023-m0019 on 6/30/24.
//

import UIKit
import SnapKit

class EditMyPage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 완료 버튼
        
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("완료", for: .normal)
        doneButton.setTitleColor(.black, for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        view.addSubview(doneButton)
        
        // 프로필 사진
        
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(systemName: "person.circle")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 50
        view.addSubview(profileImageView)
        
        // SnapKit으로 레이아웃 설정
        
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(doneButton).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
}







