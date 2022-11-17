//
//  LogInViewController.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 19.10.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    var loginDelegate: LoginViewControllerDelegate?
    private lazy var loginView = LoginView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private lazy var wrongLoginPasswordAlert: UIAlertController = {
        let alert = UIAlertController(title: "Неправильный логин или пароль", message: "Вы ввели не правильный логин или пароль", preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel)
        alert.addAction(action)
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        pushProfileVC()
        addTapGesture()
        scrollView.contentSize.width = view.bounds.width
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        registerNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func setView() {
        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        loginView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        loginView.logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_topMargin).offset(120)
        }
    }
    
    func addTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func pushProfileVC() {
        loginView.loginPasswordComplition = {login, password in
            guard let user = self.loginDelegate?.chek(login: login, password: password)
            else {
                return self.present(self.wrongLoginPasswordAlert, animated: true)
            }
            let profileViewController = ProfileViewController(user: user)
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
    
    @objc private func hideKeyBoard(){
        self.view.endEditing(true)
        scrollView.setContentOffset( .zero, animated: true)
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification){
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        let keyboardHeight = keyboardSize.height
        let loginStuckMaxY = loginView.loginButtonFrame.maxY
        let keyBoardOriginY = view.frame.height - keyboardHeight
        let yOffset = loginStuckMaxY > keyBoardOriginY ? loginStuckMaxY - keyBoardOriginY + 16 : .zero
        scrollView.setContentOffset(CGPoint(x: 0, y: yOffset), animated: true)
    }
    
    @objc private func keyboardWillHide(notification: NSNotification){
        hideKeyBoard()
    }
}
