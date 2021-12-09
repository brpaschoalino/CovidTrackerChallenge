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
    }

    @IBAction func didTapLogin(_ sender: Any) {
        guard let email = self.emailTextField.text,
              let password = self.passwordTextField.text else { return }

        
        if viewModel.checkValidSignIn(email: email, password: password) {
            coordinator?.goToFeedMenu()
            
        } else {
            let alert = UIAlertController(title: "Failed Sign In", message: "Failed Sign In due to wrong email or password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil ))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
