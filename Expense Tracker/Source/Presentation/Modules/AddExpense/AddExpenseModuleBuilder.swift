//
//  ModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

final class AddExpenseModuleBuilder {
    static func build() -> UIViewController {
        
        // MARK: - Assembly
        
        let container = CoreDataContainer()
        let storage = CoreDataStorage(container: container)
        
        let presenter = AddExpensePresenter(storage: storage)
        let viewController = AddExpenseViewController(presenter: presenter)
        presenter.view = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        let coordinator = AddExpenseCoordinator(navigationController: navigationController)
        presenter.coordinator = coordinator
        
        return navigationController
    }
}
