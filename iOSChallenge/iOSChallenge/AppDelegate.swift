//
//  AppDelegate.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 30/11/21.
//

import UIKit

typealias AppDelegateType = UIResponder & UIApplicationDelegate

class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: MainCoordinator?
    var window: UIWindow?
    private lazy var navigationController = UINavigationController()
    private lazy var appDelegates: [AppDelegateType] = {
        var delegates: [AppDelegateType] = [
            
        ]

        return delegates
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}

