//
//  Expense.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 22.05.2023.
//

import UIKit

enum ExpenseDetailType {
    case date
    case amount
    case note
}

struct Expense {
    let categoryImage: UIImage
    let date: Date
    let amount: Double
    let note: String?
    let isAmountSet: Bool
    
    static func makeExpense() -> [Expense] {
        var expenseModel = [Expense]()
        
        expenseModel.append(Expense(categoryImage: UIImage(named: "icon_operations")!, date: Date(), amount: 0, note: "Добавить", isAmountSet: false))
        
        return expenseModel
    }
}
