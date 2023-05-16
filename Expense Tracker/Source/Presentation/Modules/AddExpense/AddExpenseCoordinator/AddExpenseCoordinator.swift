//
//  AddExpenseCoordinator.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 10.05.2023.
//

import UIKit

protocol AddExpenseCoordinatorProtocol: CoordinatorProtocol {
    func pushCategory(with model: Category)
    // Пока что здесь будет один метод . Может в будущем добавим сюда другие методы
}

final class AddExpenseCoordinator: AddExpenseCoordinatorProtocol {
    private(set) var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func pushCategory(with model: Category) {
        //пока что останется пустой
    }
}
