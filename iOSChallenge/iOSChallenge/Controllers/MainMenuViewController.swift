//
//  MainMenuViewController.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 30/11/21.
//

import UIKit

class MainMenuViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        coordinator?.tappedLogin()
    }

    @IBAction func registerButtonTapped(_ sender: Any) {
        coordinator?.tappedRegister()
    }
}
