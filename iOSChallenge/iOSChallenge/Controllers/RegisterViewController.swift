//
//  RegisterViewController.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 01/12/21.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?

    private let viewModel = RegisterViewModel()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapSignUp(_ sender: Any) {
        guard let email = self.emailTextField.text,
              let password = self.passwordTextField.text else { return }

        if viewModel.saveSignUp(email: email, password: password) {
            coordinator?.goToLogin()
        } else {

        }
    }
}
