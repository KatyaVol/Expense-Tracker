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
        
        let presenter: AddExpensePresenterProtocol = AddExpensePresenter()
        let viewController: AddExpenseViewControllerProtocol & UIViewController = AddExpenseViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}
