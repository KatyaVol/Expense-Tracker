//
//  CategoryModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//

import UIKit

final class CategoryModuleBuilder {
    static func build(coordinator: ExpenseCollectionCoordinatorProtocol) -> UIViewController {
        
        // MARK: - Assembly
        
        let presenter = CategoryPresenter(coordinator: coordinator)
        
        let viewController = CategoryViewController(presenter: presenter)
        presenter.view = viewController
        
        coordinator.navigationController.navigationBar.tintColor = Colors.whiteAndBlack
        
        return viewController
    }
}

