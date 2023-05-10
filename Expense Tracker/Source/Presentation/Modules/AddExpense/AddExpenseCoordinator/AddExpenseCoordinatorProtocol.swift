//
//  AddExpenseCoordinatorProtocol.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 10.05.2023.
//

import UIKit

protocol AddExpenseCoordinatorProtocol: CoordinatorProtocol {
    func pushCategory(with model: Category)
    // Пока что здесь будет один метод . Может в будущем добавим сюда другие методы
}
