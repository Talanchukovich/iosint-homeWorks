//
//  LoginInspector.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 11.11.2022.
//

import Foundation

struct LoginInspector: LoginViewControllerDelegate {
    
    var userSevice: UserService?
    
    init() {
        #if DEBUG
        userSevice = TestUserService()
        #else
        userSevice = CurrentUserService()
        #endif
    }
    
    func chek(login: String, password: String) -> User?{
        return Checker.shared.chek(login: login, password: password) ? userSevice?.checkLogin(login: login) : nil
        
        
    }
}
