//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 09.11.2022.
//

import UIKit

class CurrentUserService: UserService {
    
    private let catUser = User(login: "cat", fullName: "Hipster Cat", avatar: UIImage(named: "cat") ?? UIImage(systemName: "")!, status: "Cat is hungry")
    
    private let dogUser = User(login: "dog", fullName: "Hipster Dog", avatar: UIImage(named: "dog") ?? UIImage(systemName: "")!, status: "Dog is runing")
    
    func returnUser(login: String) -> User? {
        let users = [catUser, dogUser]
        return users.first(where: {$0.login == login})
    }
}
