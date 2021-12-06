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

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
