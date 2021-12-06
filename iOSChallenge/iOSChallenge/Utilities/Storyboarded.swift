//
//  Storyboarded.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 01/12/21.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "MainMenuStoryBoard", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }

    static func instantiateLoginStoryBoard() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "LoginStoryBoard", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }

    static func instantiateRegisterStoryBoard() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "RegisterStoryBoard", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }

    static func instantiateMenuStoryBoard() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "MenuStoryBoard", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
    
    static func instantiateFeedMenuStoryBoard() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "FeedMenuStoryBoard", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
