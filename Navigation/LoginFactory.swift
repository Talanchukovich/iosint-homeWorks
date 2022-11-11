//
//  LoginFactory.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 11.11.2022.
//

import Foundation

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}
