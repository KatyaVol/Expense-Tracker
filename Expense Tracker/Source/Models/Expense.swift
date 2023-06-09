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
                                           title: NSLocalizedString("category_title", comment: ""),
                                           image: UIImage(named: "icon_operations"),
                                           text: nil)
        let dateDetail = ExpenseDetail(type: .date,
                                       title: NSLocalizedString("date_title", comment: ""),
                                       image: nil,
                                       text: NSLocalizedString("date_text", comment: ""))
        let amountDetail = ExpenseDetail(type: .amount,
                                         title: NSLocalizedString("amount_title", comment: ""),
                                         image: nil,
                                         text: NSLocalizedString("amount_text", comment: ""))
        let noteDetail = ExpenseDetail(type: .note,
                                       title: NSLocalizedString("note_title", comment: ""),
                                       image: nil,
                                       text: NSLocalizedString("note_text", comment: ""))
        
        let arrayOfExpenseDetails = [categoryDetail, dateDetail, amountDetail, noteDetail]
        
        expenseDetails.append(arrayOfExpenseDetails)
        expenseDetails.append(arrayOfExpenseDetails)
        
        return expenseDetails
    }
}

