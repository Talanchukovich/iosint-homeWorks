////
////  LoginView.swift
////  Navigation
////
////  Created by Andrey Talanchuk on 11.11.2022.
////
//
//import UIKit
//
//class LoginView: UIView {
//    
//    var keyBoardComplition: (()->Void)?
//    
//    private var activTextfield: UITextField?
//    
//    private lazy var contentView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }()
//    
//    private lazy var logoImageView: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "logo")
//        return image
//    }()
//    
//    private lazy var loginPasswordTextFieldsStuckView: UIStackView = {
//        let stuck = UIStackView()
//        stuck.axis = .vertical
//        stuck.spacing = 16
//        stuck.layer.borderColor = UIColor.black.cgColor
//        stuck.layer.borderWidth = 0.5
//        stuck.layer.cornerRadius = 10
//        stuck.backgroundColor = .systemGray6
//        return stuck
//    }()
//    
//    private lazy var loginTextField: UITextField = {
//        let textField = UITextField()
//        textField.font = UIFont.systemFont(ofSize: 16)
//        textField.textColor = .black
//        textField.autocapitalizationType = .none
//        textField.placeholder = "Email or phone"
//        textField.backgroundColor = .systemGray6
//        return textField
//    }()
//    
//    private lazy var passwordTextField: UITextField = {
//        let textField = UITextField()
//        textField.font = UIFont.systemFont(ofSize: 16)
//        textField.textColor = .black
//        textField.autocapitalizationType = .none
//        textField.placeholder = "Password"
//        textField.backgroundColor = .systemGray6
//        textField.isSecureTextEntry = true
//        return textField
//    }()
//    
//    private lazy var mideLineTextFieldStuckView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .black
//        return view
//    }()
//    
//    private lazy var loginButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Log In", for: .normal)
//        let image = UIImage(named: "blue-pixel")
//        button.setBackgroundImage(image?.alpha(1), for: .normal)
//        button.setBackgroundImage(image?.alpha(0.8), for: .selected)
//        button.setBackgroundImage(image?.alpha(0.8), for: .highlighted)
//        button.setBackgroundImage(image?.alpha(0.8), for: .disabled)
//        button.tintColor = .white
//        button.layer.cornerRadius = 10
//        button.clipsToBounds = true
//        button.addTarget(self, action: #selector(pushProfileVC), for: .touchUpInside)
//        return button
//    }()
//    
//    private lazy var loginViews = [logoImageView, loginPasswordTextFieldsStuckView, loginTextField, passwordTextField, mideLineTextFieldStuckView, loginButton]
//
//
//func setView(){
//    
//    loginViews.forEach({self.addSubview($0)})
//    
//    logoImageView.snp.makeConstraints { make in
//        make.centerX.equalTo(self.snp.centerX)
//        make.top.equalTo(self.snp.top).inset(120)
//        make.width.equalTo(100)
//        make.height.equalTo(100)
//    }
//    
//    loginPasswordTextFieldsStuckView.snp.makeConstraints { make in
//        make.top.equalTo(logoImageView.snp.bottom).inset(-120)
//        make.leading.equalTo(contentView.snp.leading).inset(16)
//        make.trailing.equalTo(contentView.snp.trailing).inset(16)
//        make.height.equalTo(100)
//    }
//    
//    mideLineTextFieldStuckView.snp.makeConstraints { make in
//        make.centerY.equalTo(loginPasswordTextFieldsStuckView.snp.centerY)
//        make.leading.equalTo(loginPasswordTextFieldsStuckView.snp.leading)
//        make.trailing.equalTo(loginPasswordTextFieldsStuckView.snp.trailing)
//        make.height.equalTo(0.5)
//    }
//    
//    loginTextField.snp.makeConstraints { make in
//        make.centerY.equalTo(loginPasswordTextFieldsStuckView.snp.centerY).offset(-25)
//        make.leading.equalTo(loginPasswordTextFieldsStuckView.snp.leading).inset(10)
//        make.trailing.equalTo(loginPasswordTextFieldsStuckView.snp.trailing).inset(10)
//    }
//    
//    passwordTextField.snp.makeConstraints { make in
//        make.centerY.equalTo(loginPasswordTextFieldsStuckView.snp.centerY).offset(25)
//        make.leading.equalTo(loginPasswordTextFieldsStuckView.snp.leading).inset(10)
//        make.trailing.equalTo(loginPasswordTextFieldsStuckView.snp.trailing).inset(10)
//    }
//    
//    loginButton.snp.makeConstraints { make in
//        make.top.equalTo(loginPasswordTextFieldsStuckView.snp.bottom).inset(-16)
//        make.leading.equalTo(contentView.snp.leading).inset(16)
//        make.trailing.equalTo(contentView.snp.trailing).inset(16)
//        make.height.equalTo(50)
//    }
//}
//    func addDelegate(){
//        loginTextField.delegate = self
//        passwordTextField.delegate = self
//    }
//}
//
//extension LoginView: UITextFieldDelegate {
//    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        activTextfield = textField
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        activTextfield = nil
//        keyBoardComplition?()
//        return true
//    }
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if activTextfield == loginTextField {
//            return string.first == " " ? false : true
//        }
//        return true
//    }
//}
