//
//  CategoryModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//

import UIKit

final class CategoryModuleBuilder {
    static func build() -> UIViewController {
        
        // MARK: - Assembly
        
        let presenter = CategoryPresenter()
        let viewController = CategoryViewController(presenter: presenter)
        presenter.view = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}

