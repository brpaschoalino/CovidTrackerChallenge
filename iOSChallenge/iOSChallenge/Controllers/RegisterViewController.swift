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
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Cadastro de Conta"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let titleTextColour = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleTextColour
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
