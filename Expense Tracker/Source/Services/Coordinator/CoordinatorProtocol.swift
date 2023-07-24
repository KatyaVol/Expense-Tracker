//
//  CoordinatorProtocol.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 10.05.2023.
//

import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    init(navigationController: UINavigationController)
}

extension CoordinatorProtocol {
    func dismissController(animated: Bool) {
        navigationController.dismiss(animated: animated)
    }
    
    func popController(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func presentController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    func pushController(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
}

