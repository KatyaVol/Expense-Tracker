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
        
        let presenter = AddExpensePresenter()
        let viewController = AddExpenseViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}
