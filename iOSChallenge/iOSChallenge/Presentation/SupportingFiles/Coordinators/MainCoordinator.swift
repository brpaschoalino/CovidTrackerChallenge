//
//  MainCoordinator.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 01/12/21.
//

import Foundation
import UIKit

class MainCoordinator: CoordinatorProtocol {
    var childCoordinators = [CoordinatorProtocol]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = LoginViewController.instantiateLoginStoryBoard()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func goToLogin() {
        let vc = LoginViewController.instantiateLoginStoryBoard()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)

    }

    func goToRegister() {
        let vc = RegisterViewController.instantiateRegisterStoryBoard()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func goToFeedMenu() {
        guard let vc = FeedMenuViewController.instantiateFeedMenuStoryBoard() else { return }
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)

    }
}
