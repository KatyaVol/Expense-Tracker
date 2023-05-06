//
//  AppCoordinator.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 06.05.2023.
//

import UIKit

protocol AppCoordinatorProtocol {
   func startApplication() -> UIViewController
}

final class AppCoordinator: AppCoordinatorProtocol {
    func startApplication() -> UIViewController {
        let tabBarController = TabBarController()
        return tabBarController
    }
}
