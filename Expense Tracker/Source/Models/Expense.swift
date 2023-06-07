//
//  Expense.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 22.05.2023.
//

import UIKit

enum ExpenseDetailType {
    case category
    case date
    case amount
    case note
}

struct ExpenseDetail {
    let type: ExpenseDetailType
    let title: String
    let image: UIImage?
    let text: String?
    
    static func makeExpenseDetails() -> [[ExpenseDetail]] {
        var expenseDetails: [[ExpenseDetail]] = []
        
        let categoryDetail = ExpenseDetail(type: .category,
                                           title: "Категория",
                                           image: UIImage(named: "icon_operations"),
                                           text: nil)
        let dateDetail = ExpenseDetail(type: .date,
                                       title: "Дата",
                                       image: nil,
                                       text: "Добавить")
        let amountDetail = ExpenseDetail(type: .amount,
                                         title: "Сумма",
                                         image: nil,
                                         text: "Добавить можно все что угодно")
        let noteDetail = ExpenseDetail(type: .note,
                                       title: "Примечание",
                                       image: nil,
                                       text: "Добавить")
        
        let arrayOfExpenseDetails = [categoryDetail, dateDetail, amountDetail, noteDetail]
        
        expenseDetails.append(arrayOfExpenseDetails)
        expenseDetails.append(arrayOfExpenseDetails)
        
        return expenseDetails
    }
}

