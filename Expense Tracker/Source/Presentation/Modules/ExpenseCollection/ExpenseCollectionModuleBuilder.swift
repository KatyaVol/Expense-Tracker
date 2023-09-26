//
//  ExpenseCollectionModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 25.09.2023.
//

import UIKit

class ExpenseCollectionModuleBuilder {
    static func build() -> UIViewController {
        
        // MARK: - Assembly
        
        let container = CoreDataContainer()
        let storage = CoreDataStorage(container: container)
        
        let presenter = ExpenseCollectionPresenter(coreDataStorage: storage)
        let viewController = ExpenseCollectionViewController(presenter: presenter)
        presenter.view = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        let coordinator = ExpenseCollectionCoordinator(navigationController: navigationController)
        presenter.coordinator = coordinator
        
        return navigationController
    }
}
