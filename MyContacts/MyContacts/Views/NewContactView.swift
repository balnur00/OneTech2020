//
//  NewContactView.swift
//  MyContacts
//
//  Created by Balnur Sakhybekova on 7/13/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import SnapKit

class NewContactView: UIView {
    lazy var textFieldStackView = UIStackView()
    lazy var imageView = UIImageView()
    
    lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "First name"
        textField.font = UIFont(name: "Helvetica", size: 35)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Last name"
        textField.font = UIFont(name: "Helvetica", size: 35)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var companyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Company"
        textField.font = UIFont(name: "Helvetica", size: 35)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        return textField
    }()
    
    func setup(){
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillEqually
        textFieldStackView.axis = .horizontal
        
        self.backgroundColor = .gray
        
        self.addSubview(imageView)
        self.addSubview(textFieldStackView)
        textFieldStackView.addArrangedSubview(firstNameTextField)
        textFieldStackView.addArrangedSubview(lastNameTextField)
        textFieldStackView.addArrangedSubview(companyTextField)
        
        imageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(12)
            make.height.width.equalTo(150)
        }
        
        firstNameTextField.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
//            make.height.equalTo(40)
        }
        lastNameTextField.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
//            make.height.equalTo(40)
        }
        companyTextField.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
//            make.height.equalTo(40)
        }
    }
    
    
    
    
    
}
