//
//  UserService.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 09.11.2022.
//

import UIKit

protocol UserService {
    func returnUser(login: String) -> User?
}
