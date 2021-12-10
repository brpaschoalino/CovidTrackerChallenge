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
    private let statesData = GetApiData()

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func doStatesDataRequest(){
        guard let statesDataUrl = URL(string: "https://covid19-brazil-api.vercel.app/api/report/v1/brazil/20200318") else { return }

        statesData.apiStatesData(url: statesDataUrl, success: { data in
            FeedMenuViewModel.shared.fillStatesData(statesData: data)

        })
    }

    @IBAction func didTapLogin(_ sender: Any) {
        guard let email = self.emailTextField.text,
              let password = self.passwordTextField.text else { return }

        
        if viewModel.checkValidSignIn(email: email, password: password) {
            doStatesDataRequest()
            coordinator?.goToFeedMenu()
            
        } else {
            let alert = UIAlertController(title: "Failed Sign In", message: "Failed Sign In due to wrong email or password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil ))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
