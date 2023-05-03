//
//  ModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

final class AddExpenseModuleBuilder {
    static func build() -> UIViewController {
        
        // MARK: - Override methods
        
        let presenter = AddExpensePresenter()
        let viewController = AddExpenseViewController(presenter: presenter)
        return viewController
    }
}
