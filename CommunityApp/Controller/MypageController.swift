//
//  MypageController.swift
//  CommunityApp
//
//  Created by t2023-m0019 on 6/25/24.
//
import UIKit
import SnapKit

class MypageController: UIViewController {
    
    let achievementLabels = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 편집 버튼
        
        let editButton = UIButton(type: .system)
        editButton.setTitle("편집", for: .normal)
        editButton.setTitleColor(.black, for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        view.addSubview(editButton)
        
        // 프로필 사진
        
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(systemName: "person.circle")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 50
        view.addSubview(profileImageView)
        
        // 레벨 UILabel
        
        let levelLabel = UILabel()
        levelLabel.text = "Lv. 37"
        levelLabel.textAlignment = .center
        view.addSubview(levelLabel)
        
        // 이름 UILabel
        
        let nameLabel = UILabel()
        nameLabel.text = "이름"
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        
        // 경험치 bar
        
        let experienceBar = UIProgressView(progressViewStyle: .default)
        experienceBar.setProgress(0.46, animated: false)
        view.addSubview(experienceBar)
        
        // 경험치 퍼센트 UILabel
        
        let experienceLabel = UILabel()
        experienceLabel.text = "46%"
        experienceLabel.textAlignment = .center
        view.addSubview(experienceLabel)
        
        // 첫 번째 horizontal stack view
        
        let hsv1 = UIStackView()
        hsv1.axis = .horizontal
        hsv1.spacing = 30
        view.addSubview(hsv1)
        
        // UIButton
        
        let mainBadgeButton = UIButton(type: .system)
        mainBadgeButton.setTitle("백준 골드", for: .normal)
        mainBadgeButton.backgroundColor = .systemBlue
        mainBadgeButton.setTitleColor(.white, for: .normal)
        mainBadgeButton.layer.cornerRadius = 20
        hsv1.addArrangedSubview(mainBadgeButton)
        
        let myFollowingButton = UIButton(type: .system)
        myFollowingButton.setTitle("내 즐겨찾기", for: .normal)
        myFollowingButton.backgroundColor = .systemBlue
        myFollowingButton.setTitleColor(.white, for: .normal)
        myFollowingButton.layer.cornerRadius = 20
        hsv1.addArrangedSubview(myFollowingButton)
        
        // 두 번째 horizontal stack view
        
        let hsv2 = UIStackView()
        hsv2.axis = .horizontal
        hsv2.distribution = .fillEqually
        hsv2.spacing = 10
        view.addSubview(hsv2)
        
        
        // UIButton
        
        let buttonTitles = [
            "보유 뱃지",
            "작성글 수",
            "받은 추천 수",
            "구독자"
        ]
        
        let numberValues = [
            4,
            57,
            179,
            17
        ]
        
        for (index, title) in buttonTitles.enumerated() {
            
            let indexButton = UIButton(type: .system)
            indexButton.setTitle(title, for: .normal)
            indexButton.setTitleColor(.black, for: .normal)
            indexButton.backgroundColor = .clear
            hsv2.addArrangedSubview(indexButton)
        }
        
        // 세 번째 horizontal stack view
        
        let hsv3 = UIStackView()
        hsv3.axis = .horizontal
        hsv3.distribution = .fillEqually
        hsv3.spacing = 10
        view.addSubview(hsv3)
        
        for (index, title) in buttonTitles.enumerated() {
            let numberLabels = UILabel()
            numberLabels.text = "\(numberValues[index])"
            numberLabels.textColor = .black
            numberLabels.textAlignment = .center
            hsv3.addArrangedSubview(numberLabels)
        }
        
        let vsv1 = UIStackView()
        vsv1.axis = .vertical
        vsv1.distribution = .fillEqually
        vsv1.spacing = 10
        vsv1.layer.cornerRadius = 10
        vsv1.backgroundColor = .white
        view.addSubview(vsv1)
        
        let achievementLabels = [
            "* 레벨 10 달성",
            "* 레벨 30 달성",
            "* 백준 실버 달성",
            "* 백준 골드 달성",
        ]
        
        for achievement in achievementLabels {
            let achievementLabel = UILabel()
            achievementLabel.text = achievement
            achievementLabel.textColor = .white
            achievementLabel.textAlignment = .center
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .black
            backgroundView.layer.cornerRadius = 15
            backgroundView.addSubview(achievementLabel)
            
            achievementLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
            }
            

            vsv1.addArrangedSubview(backgroundView)
        }
        
        // 네 번째 horizontal stack view
        
        let hsv4 = UIStackView()
        hsv4.axis = .horizontal
        hsv4.distribution = .fillEqually
        view.addSubview(hsv4)
        
        let termsButton = UIButton(type: .system)
        termsButton.setTitle("약관/정책", for: .normal)
        termsButton.titleLabel?.textAlignment = .center
        hsv4.addArrangedSubview(termsButton)
        
        let supportButton = UIButton(type: .system)
        supportButton.setTitle("고객센터", for: .normal)
        supportButton.titleLabel?.textAlignment = .center
        hsv4.addArrangedSubview(supportButton)
        
        // 로그아웃 버튼
        
        let logoutButton = UIButton(type: .system)
        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.setTitleColor(.red, for: .normal)
        view.addSubview(logoutButton)
        
        // SnapKit으로 레이아웃 설정
        
        editButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(editButton).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(levelLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        experienceBar.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        experienceLabel.snp.makeConstraints { make in
            make.top.equalTo(experienceBar.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        mainBadgeButton.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
        
        myFollowingButton.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
        
        hsv1.snp.makeConstraints { make in
            make.top.equalTo(experienceLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        hsv2.snp.makeConstraints { make in
            make.top.equalTo(hsv1.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }
        
        hsv3.snp.makeConstraints { make in
            make.top.equalTo(hsv2.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }
        
        vsv1.snp.makeConstraints { make in
            make.top.equalTo(hsv3.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(60)
        }
        
        hsv4.snp.makeConstraints { make in
            make.bottom.equalTo(logoutButton.snp.top).offset(-4)
            make.leading.trailing.equalToSuperview().inset(100)
            make.height.equalTo(20)
        }

        logoutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
        }
        
    }
}







