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
        
        let container = CoreDataContainer.shared
        let storage = CoreDataStorage(container: container)
        
        let presenter = AddExpensePresenter(coreDataStorage: storage)
        let viewController = AddExpenseViewController(presenter: presenter)
        presenter.view = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        let coordinator = ExpenseCollectionCoordinator(navigationController: navigationController)
        presenter.coordinator = coordinator
        
        return navigationController
    }
}
