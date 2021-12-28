//
//  LoginViewModel.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 03/12/21.
//

import Foundation
import KeychainSwift

class LoginViewModel {

    func checkValidSignIn(email: String, password: String) -> Bool{
        let keychain = KeychainSwift()

        if password == keychain.get("password") && 
            email == keychain.get("emailLogin") {

        }
        return password == keychain.get("password") && email == keychain.get("emailLogin")

    }
}
