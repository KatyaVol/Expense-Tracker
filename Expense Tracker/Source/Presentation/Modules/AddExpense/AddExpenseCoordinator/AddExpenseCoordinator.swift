//
//  AddExpenseCoordinator.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 10.05.2023.
//

import UIKit

protocol AddExpenseCoordinatorProtocol: CoordinatorProtocol {
    func pushCategory()
    // Пока что здесь будет один метод . Может в будущем добавим сюда другие методы
}

final class AddExpenseCoordinator: AddExpenseCoordinatorProtocol {
    
    // MARK: - Private properties
    
    private(set) var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal methods
    
    func pushCategory() {
        let categoryViewController = CategoryModuleBuilder.build(navigationController: navigationController)
        pushController(categoryViewController, animated: true)
    }
}
