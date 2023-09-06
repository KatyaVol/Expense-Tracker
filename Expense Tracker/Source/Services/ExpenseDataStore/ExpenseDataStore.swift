//
//  ExpenseDataStore.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.08.2023.
//

import UIKit

struct Expense {
    var category: Category?
    var date: Date?
    var amount: String?
    var note: String?
}

final class ExpenseDataStore {
    static let shared = ExpenseDataStore()
    
    private init() {
        currentExpenseDetails = ExpenseDetail.makeExpenseDetails()
        currentExpense = Expense()
    }
    
    private(set) var currentExpenseDetails: [[ExpenseDetail]]
    private  var currentExpense: Expense?
    
    func getCurrentExpense() -> Expense? { return currentExpense }
    
    func changeModelWith(category: Category) {
        currentExpense?.category = category
        currentExpenseDetails = currentExpenseDetails.map { section in
            section.map { detail in
                guard detail.type == .category else { return detail }
                return ExpenseDetail(type: detail.type,
                                     title: detail.title,
                                     image: category.image,
                                     text: category.text)
            }
        }
    }
    
    func changeModelWith(date: Date) {
        currentExpense?.date = date
        currentExpenseDetails = currentExpenseDetails.map { section in
            section.map { detail in
                guard detail.type == .date else { return detail }
                let formattedDate = DateFormatter.dateString(from: date)
                return ExpenseDetail(type: detail.type,
                                     title: detail.title,
                                     image: detail.image,
                                     text: formattedDate)
            }
        }
    }
    
    func changeModelWith(amount: String) {
        currentExpense?.amount = amount
        currentExpenseDetails = currentExpenseDetails.map { section in
            section.map { detail in
                guard detail.type == .amount else { return detail }
                return ExpenseDetail(type: detail.type,
                                     title: detail.title,
                                     image: detail.image,
                                     text: amount)
            }
        }
    }
    
    func changeModelWith(note: String) {
        currentExpense?.note = note
        currentExpenseDetails = currentExpenseDetails.map { section in
            section.map { detail in
                guard detail.type == .note else { return detail }
                return ExpenseDetail(type: detail.type,
                                     title: detail.title,
                                     image: detail.image,
                                     text: note)
            }
        }
    }
}
