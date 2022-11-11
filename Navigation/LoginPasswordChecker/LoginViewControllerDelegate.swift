//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 11.11.2022.
//

import Foundation

protocol LoginViewControllerDelegate {
    func chek(login: String, password: String) -> User?
}
