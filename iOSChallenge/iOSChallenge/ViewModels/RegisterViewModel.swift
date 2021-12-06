//
//  RegisterViewController.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 03/12/21.
//

import Foundation
import KeychainSwift

class RegisterViewModel {
    func saveSignUp(email: String, password: String) -> Bool {
        let keychain = KeychainSwift()

        return keychain.set(email, forKey: "emailLogin") && keychain.set(password, forKey: "password")

    }
}
