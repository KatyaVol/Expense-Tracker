//
//  AddExpenseCoordinator.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 10.05.2023.
//

import UIKit

protocol AddExpenseCoordinatorProtocol: AnyObject {
    func pushCategory()
    // Пока что здесь будет один метод . Может в будущем добавим сюда другие методы
}

final class AddExpenseCoordinator: AddExpenseCoordinatorProtocol {
    private(set) var navigationController: UINavigationController
    private let categoryModuleBuilder: CategoryModuleBuilder
    
    init(navigationController: UINavigationController, categoryModuleBuilder: CategoryModuleBuilder) {
        self.navigationController = navigationController
        self.categoryModuleBuilder = categoryModuleBuilder
    }
    
    func pushCategory() {
        let categoryViewController = CategoryModuleBuilder.build(navigationController: navigationController)
        navigationController.pushViewController(categoryViewController, animated: true)
    }
}
