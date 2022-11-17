//
//  LoginView.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 11.11.2022.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    var keyBoardComplition: (()->Void)?
    var loginPasswordComplition: ((_ login: String, _ password: String) -> Void)?
    lazy var loginButtonFrame = loginButton.frame
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        return image
    }()
    
    private lazy var loginPasswordTextFieldsStuckView: UIStackView = {
        let stuck = UIStackView()
        stuck.axis = .vertical
        stuck.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        stuck.isLayoutMarginsRelativeArrangement = true
        stuck.distribution = .fillProportionally
        stuck.layer.borderColor = UIColor.black.cgColor
        stuck.layer.borderWidth = 0.5
        stuck.layer.cornerRadius = 10
        stuck.backgroundColor = .systemGray6
        return stuck
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        textField.text = "test1"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.text = "pass"
        return textField
    }()
    
    private lazy var mideLineTextFieldStuckView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        let image = UIImage(named: "blue-pixel")
        button.setBackgroundImage(image?.alpha(1), for: .normal)
        button.setBackgroundImage(image?.alpha(0.8), for: .selected)
        button.setBackgroundImage(image?.alpha(0.8), for: .highlighted)
        button.setBackgroundImage(image?.alpha(0.8), for: .disabled)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginViews = [logoImageView, loginPasswordTextFieldsStuckView, mideLineTextFieldStuckView, loginButton]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView(){
        loginPasswordTextFieldsStuckView.addArrangedSubview(loginTextField)
        loginPasswordTextFieldsStuckView.addArrangedSubview(passwordTextField)
        loginViews.forEach({self.addSubview($0)})
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(120)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        loginPasswordTextFieldsStuckView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(340)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.height.equalTo(100)
        }
        
        mideLineTextFieldStuckView.snp.makeConstraints { make in
            make.centerY.equalTo(loginPasswordTextFieldsStuckView.snp.centerY)
            make.leading.equalTo(loginPasswordTextFieldsStuckView.snp.leading)
            make.trailing.equalTo(loginPasswordTextFieldsStuckView.snp.trailing)
            make.height.equalTo(0.5)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(loginPasswordTextFieldsStuckView.snp.bottom).inset(-16)
            make.leading.equalTo(self.snp.leading).inset(16)
            make.trailing.equalTo(self.snp.trailing).inset(16)
            make.height.equalTo(50)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    @objc private func buttonDidTap() {
        guard let login = loginTextField.text else {return}
        guard let password =  passwordTextField.text else {return}
        loginPasswordComplition?(login, password)
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonDidTap()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == loginTextField {
            return string.first == " " ? false : true
        }
        return true
    }
}

extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
