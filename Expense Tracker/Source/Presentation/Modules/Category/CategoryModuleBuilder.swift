//
//  CategoryModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//

import UIKit

final class CategoryModuleBuilder {
    static func build(coordinator: AddExpenseCoordinatorProtocol) -> UIViewController {
        
        // MARK: - Assembly
        
        let presenter = CategoryPresenter()
     
        let viewController = CategoryViewController(presenter: presenter, coordinator: coordinator)
        presenter.view = viewController
        
        coordinator.navigationController.navigationBar.tintColor = Colors.whiteAndBlack
        
        return viewController
    }
}

