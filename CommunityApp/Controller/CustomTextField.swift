//
//  CustomTextField.swift
//  CommunityApp
//
//  Created by t2023-m0019 on 7/1/24.
//

import UIKit

class CustomTextField: UITextField {
    
    init(placeHolder: String) {
        super.init(frame: .zero)
        
        let space = UIView()
        space.setDimension(height: 50, width: 13)
        leftView = space
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(50)
        attributedPlaceholder = NSAttributedString(
            string: placeHolder,
            attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
