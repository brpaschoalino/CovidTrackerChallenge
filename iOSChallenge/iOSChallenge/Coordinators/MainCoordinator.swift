//
//  MainCoordinator.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 01/12/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainMenuViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func tappedLogin() {
        let vc = LoginViewController.instantiateLoginStoryBoard()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)

    }

    func tappedRegister() {
        let vc = RegisterViewController.instantiateRegisterStoryBoard()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
