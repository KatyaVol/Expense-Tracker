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
    var image: UIImage?
    var text: String?
    
    static func makeExpenseDetails() -> [[ExpenseDetail]] {
        var expenseDetails: [[ExpenseDetail]] = []
        
        let categoryDetail = ExpenseDetail(type: .category,
                                           title: LocalizedStrings.categoryTitle,
                                           image: UIImage(named: "icon_operations"),
                                           text: LocalizedStrings.categoryName)
        let dateDetail = ExpenseDetail(type: .date,
                                       title: LocalizedStrings.dateTitle,
                                       image: nil,
                                       text: LocalizedStrings.dateText)
        let amountDetail = ExpenseDetail(type: .amount,
                                         title: LocalizedStrings.amountTitle,
                                         image: nil,
                                         text: LocalizedStrings.amountText)
        let noteDetail = ExpenseDetail(type: .note,
                                       title: LocalizedStrings.noteTitle,
                                       image: nil,
                                       text: LocalizedStrings.noteText)
        
        let arrayOfExpenseDetails = [categoryDetail, dateDetail, amountDetail, noteDetail]
        
        expenseDetails.append(arrayOfExpenseDetails)
        expenseDetails.append(arrayOfExpenseDetails)
        
        return expenseDetails
    }
}

