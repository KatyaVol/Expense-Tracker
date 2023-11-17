//
//  ExpenseCollectionModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 25.09.2023.
//

import UIKit

final class ExpenseCollectionModuleBuilder {
    static func build(navigationController: UINavigationController) -> ExpenseCollectionViewController {
        
        // MARK: - Assembly
        
        let container = CoreDataContainer.shared
        let storage = CoreDataStorage(container: container)
        
        let presenter = ExpenseCollectionPresenter(coreDataStorage: storage)
        let viewController = ExpenseCollectionViewController(presenter: presenter)
        presenter.view = viewController
        let coordinator = ExpenseCollectionCoordinator(navigationController: navigationController)
        presenter.coordinator = coordinator
        
        return viewController
    }
}
