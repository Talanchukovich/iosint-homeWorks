//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 11.11.2022.
//

import Foundation

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
    
    
}
