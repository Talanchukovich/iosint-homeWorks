//
//  Checker.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 11.11.2022.
//

import Foundation

class Checker {
    
    static let shared = Checker()
    
    private let logins = ["cat", "dog"]
    private let testLogins = ["test1", "test2"]
    private let password = "pass"
    
    func chek(login: String, password: String) -> Bool {
        #if DEBUG
        testLogins.first(where: {$0 == login}) != nil && self.password == password ? true : false
        #else
        logins.first(where: {$0 == login}) != nil && self.password == password ? true : false
        #endif
    }
    
    private init() {}
    
    
}
