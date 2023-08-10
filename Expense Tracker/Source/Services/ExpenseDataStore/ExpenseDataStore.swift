//
//  ExpenseDataStore.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.08.2023.
//

import UIKit

final class ExpenseDataStore {
    static let shared = ExpenseDataStore()
    
    private init() {
        currentExpenseDetails = ExpenseDetail.makeExpenseDetails()
    }
    
    private(set) var currentExpenseDetails: [[ExpenseDetail]]
    
    func changeModelWith(category: Category) {
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
}

