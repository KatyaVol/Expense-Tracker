//
//  ExpenseCheckService.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 03.10.2023.
//

import UIKit

enum ExpenseValidationError: Error {
    case missingCategory
    case missingDate
    case missingAmount
}

struct ExpenseValidator {
    func validate(expense: Expense) -> Result<Expense, ExpenseValidationError> {
        if expense.category == nil {
            return .failure(.missingCategory)
        }
        if expense.date == nil {
            return .failure(.missingDate)
        }
        if expense.amount == nil {
            return .failure(.missingAmount)
        }
        return .success(expense)
    }
}

extension ExpenseValidationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingCategory:
            return LocalizedStrings.chooseCategory
        case .missingDate:
            return LocalizedStrings.chooseDate
        case .missingAmount:
            return LocalizedStrings.enterTheAmount
        }
    }
}
