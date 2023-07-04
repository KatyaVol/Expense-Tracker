//
//  CategoryModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//

import UIKit

final class CategoryModuleBuilder {
    static func build(navigationController: UINavigationController) -> UIViewController {
        
        // MARK: - Assembly
        
        let presenter = CategoryPresenter()
        let coordinator = CategoryCoordinator(navigationController: navigationController)
        let viewController = CategoryViewController(presenter: presenter, coordinator: coordinator)
        presenter.view = viewController
        
        navigationController.navigationBar.tintColor = Colors.whiteAndBlack
        
        return viewController
    }
}

