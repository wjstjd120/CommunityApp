//
//  EditMyPage.swift
//  CommunityApp
//
//  Created by t2023-m0019 on 6/30/24.
//
import UIKit
import SnapKit

class EditMyPage: UIViewController {
    
    private var profileImage: UIImage?
    private let addProfilePhotoButton: UIButton = {
        let bt = UIButton(type: .system)
        if let image = UIImage(named: "add2") {
            bt.setImage(image, for: .normal)
        } else {
            print("이미지를 찾을 수 없습니다")
        }
        bt.tintColor = .black
        bt.addTarget(self, action: #selector(handleProfileButton), for: .touchDown)
        return bt
    }()
    private let userNameChangeTextField: CustomTextField = {
        let et = CustomTextField(placeHolder: "변경할 닉네임을 입력해주세요.")
        et.keyboardType = .emailAddress
        et.textColor = .black
        et.layer.cornerRadius = 10
        et.backgroundColor = .white
        et.borderStyle = .roundedRect
        et.autocapitalizationType = .none
        et.attributedPlaceholder = NSAttributedString(
            string: "변경할 닉네임을 입력해주세요.",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        return et
    }()
    private let passwordChangeTextField: CustomTextField = {
        let pt = CustomTextField(placeHolder: "변경할 비밀번호를 입력해주세요.")
        pt.isSecureTextEntry = true
        pt.textColor = .black
        pt.layer.cornerRadius = 10
        pt.backgroundColor = .white
        pt.borderStyle = .roundedRect
        pt.autocapitalizationType = .none
        pt.attributedPlaceholder = NSAttributedString(
            string: "변경할 비밀번호를 입력해주세요.",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        pt.isSecureTextEntry = true
        return pt
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureBackButton()
        view.backgroundColor = .white
    }
    
    private func configureBackButton() {
        let backButton = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func configureUI() {

        
        view.addSubview(addProfilePhotoButton)
        addProfilePhotoButton.centerX(inview: view)
        addProfilePhotoButton.setDimension(height: 130, width: 130)
        addProfilePhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 30)
        
        let stack = UIStackView(arrangedSubviews: [userNameChangeTextField, passwordChangeTextField])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: addProfilePhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30)
        
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("완료", for: .normal)
        doneButton.setTitleColor(.black, for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        doneButton.addTarget(self, action: #selector(handleEditMyPage), for: .touchDown)
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    @objc private func handleEditMyPage() {
        guard let userNameChange = userNameChangeTextField.text, !userNameChange.isEmpty else { return }
        guard let passwordChange = passwordChangeTextField.text, !passwordChange.isEmpty else { return }
    }
    @objc private func handleProfileButton() {
        let selectPhoto = UIImagePickerController()
        selectPhoto.delegate = self
        selectPhoto.allowsEditing = true
        present(selectPhoto, animated: true, completion: nil)
    }
    @objc private func handleBackButton() {
        dismiss(animated: true, completion: nil)
    }
}
extension EditMyPage: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        profileImage = selectedImage
        addProfilePhotoButton.contentMode = .scaleAspectFill
        addProfilePhotoButton.clipsToBounds = true
        addProfilePhotoButton.layer.cornerRadius = addProfilePhotoButton.frame.width / 2
        addProfilePhotoButton.layer.masksToBounds = true
        addProfilePhotoButton.layer.borderColor = UIColor.yellow.cgColor
        addProfilePhotoButton.layer.borderWidth = 2
        addProfilePhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        self.dismiss(animated: true, completion: nil)
    }
}
