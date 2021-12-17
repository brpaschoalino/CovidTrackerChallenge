//
//  LoginViewController.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 01/12/21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?

    private let viewModel = LoginViewModel()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Login Menu"
        let titleTextColour = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = titleTextColour
    }

    @IBAction func didTapRegister(_ sender: Any) {

        coordinator?.goToRegister()
    }

    @IBAction func didTapLogin(_ sender: Any) {
        guard let email = self.emailTextField.text,
              let password = self.passwordTextField.text else { return }

        
        if viewModel.checkValidSignIn(email: email, password: password) {
            coordinator?.goToFeedMenu()
            
        } else {
            let alert = UIAlertController(title: "Falha no Login", message: "Login ou Senha Incorretos. Tente Novamente", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil ))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
