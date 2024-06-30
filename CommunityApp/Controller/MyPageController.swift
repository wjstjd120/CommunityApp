//
//  MyPageController.swift
//  CommunityApp
//
//  Created by t2023-m0019 on 6/25/24.
//
import UIKit
import SnapKit

class MyPageController: UIViewController {
    
    let achievementLabels = UILabel()
    let profileImageView = UIImageView()
    let levelLabel = UILabel()
    let nameLabel = UILabel()
    let experienceBar = UIProgressView(progressViewStyle: .default)
    let experienceLabel = UILabel()
    let hsv1 = UIStackView()
    let mainBadgeButton = UIButton(type: .system)
    let myFollowingButton = UIButton(type: .system)
    let hsv2 = UIStackView()
    let hsv3 = UIStackView()
    let vsv1 = UIStackView()
    let hsv4 = UIStackView()
    let termsButton = UIButton(type: .system)
    let supportButton = UIButton(type: .system)
    let logoutButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureEditButton()
        configureUI()
        setupConstraints()
    }
    
    private func configureEditButton() {
        let editButton = UIButton(type: .system)
        editButton.setTitle("편집", for: .normal)
        editButton.setTitleColor(.black, for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        editButton.addTarget(self, action: #selector(handleEditButton), for: .touchDown)
        view.addSubview(editButton)
        editButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    private func configureUI() {
        
        // 프로필 사진
        profileImageView.image = UIImage(systemName: "person.circle")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 50
        view.addSubview(profileImageView)
        
        // 레벨 UILabel
        levelLabel.text = "Lv. 37"
        levelLabel.textAlignment = .center
        view.addSubview(levelLabel)
        
        // 이름 UILabel
        nameLabel.text = "이름"
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        
        // 경험치 bar
        experienceBar.setProgress(0.46, animated: false)
        view.addSubview(experienceBar)
        
        // 경험치 퍼센트 UILabel
        experienceLabel.text = "46%"
        experienceLabel.textAlignment = .center
        view.addSubview(experienceLabel)
        
        // 첫 번째 horizontal stack view
        hsv1.axis = .horizontal
        hsv1.spacing = 30
        view.addSubview(hsv1)
        
        mainBadgeButton.setTitle("백준 골드", for: .normal)
        mainBadgeButton.backgroundColor = .systemBlue
        mainBadgeButton.setTitleColor(.white, for: .normal)
        mainBadgeButton.layer.cornerRadius = 20
        hsv1.addArrangedSubview(mainBadgeButton)
        
        myFollowingButton.setTitle("내 즐겨찾기", for: .normal)
        myFollowingButton.backgroundColor = .systemBlue
        myFollowingButton.setTitleColor(.white, for: .normal)
        myFollowingButton.layer.cornerRadius = 20
        hsv1.addArrangedSubview(myFollowingButton)
        
        // 두 번째 horizontal stack view
        hsv2.axis = .horizontal
        hsv2.distribution = .fillEqually
        hsv2.spacing = 10
        view.addSubview(hsv2)
        
        let buttonTitles = ["보유 뱃지", "작성글 수", "받은 추천 수", "구독자"]
        
        for title in buttonTitles {
            let indexButton = UIButton(type: .system)
            indexButton.setTitle(title, for: .normal)
            indexButton.setTitleColor(.black, for: .normal)
            indexButton.backgroundColor = .clear
            hsv2.addArrangedSubview(indexButton)
        }
        
        // 세 번째 horizontal stack view
        hsv3.axis = .horizontal
        hsv3.distribution = .fillEqually
        hsv3.spacing = 10
        view.addSubview(hsv3)
        let numberValues = [4, 57, 179, 17]
        for number in numberValues {
            let numberLabel = UILabel()
            numberLabel.text = "\(number)"
            numberLabel.textColor = .black
            numberLabel.textAlignment = .center
            hsv3.addArrangedSubview(numberLabel)
        }
        
        // 첫 번째 vertical stack view
        vsv1.axis = .vertical
        vsv1.distribution = .fillEqually
        vsv1.spacing = 10
        vsv1.layer.cornerRadius = 10
        vsv1.backgroundColor = .white
        view.addSubview(vsv1)
        
        let achievementTitles = ["* 레벨 10 달성", "* 레벨 30 달성", "* 백준 실버 달성", "* 백준 골드 달성"]
        for achievement in achievementTitles {
            
            let achievementLabel = UILabel()
            achievementLabel.text = achievement
            achievementLabel.textColor = .black
            achievementLabel.textAlignment = .center
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .white
            backgroundView.layer.cornerRadius = 15
            backgroundView.layer.borderWidth = 1
            backgroundView.layer.borderColor = UIColor.black.cgColor
            backgroundView.addSubview(achievementLabel)
            achievementLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
            }
            vsv1.addArrangedSubview(backgroundView)
        }
        
        // 네 번째 horizontal stack view
        hsv4.axis = .horizontal
        hsv4.distribution = .fillEqually
        view.addSubview(hsv4)
        
        termsButton.setTitle("약관/정책", for: .normal)
        termsButton.titleLabel?.textAlignment = .center
        hsv4.addArrangedSubview(termsButton)
        
        supportButton.setTitle("고객센터", for: .normal)
        supportButton.titleLabel?.textAlignment = .center
        hsv4.addArrangedSubview(supportButton)
        
        // 로그아웃 버튼
        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.setTitleColor(.red, for: .normal)
        view.addSubview(logoutButton)
    }
    
    private func setupConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
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
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        experienceLabel.snp.makeConstraints { make in
            make.top.equalTo(experienceBar.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        hsv1.snp.makeConstraints { make in
            make.top.equalTo(experienceLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        mainBadgeButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.leading.equalToSuperview().inset(50)
        }
        
        myFollowingButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.trailing.equalToSuperview().inset(50)
        }
        
        hsv2.snp.makeConstraints { make in
            make.top.equalTo(hsv1.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        hsv3.snp.makeConstraints { make in
            make.top.equalTo(hsv2.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        vsv1.snp.makeConstraints { make in
            make.top.equalTo(hsv3.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        hsv4.snp.makeConstraints { make in
            make.top.equalTo(vsv1.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(hsv4.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc private func handleEditButton() {
        let editMyPageVC = EditMyPage()
        let navigationController = UINavigationController(rootViewController: editMyPageVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }

}
