//
//  ExpenseCheckService.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 03.10.2023.
//

import Foundation

enum ExpenseValidationError: Error {
    case missingCategory
    case missingDate
    case missingAmount
}

struct ExpenseValidator {
    static func validate(expense: Expense, completion: (Result<Expense, ExpenseValidationError>) -> Void) {
        if expense.category == nil {
            completion(.failure(.missingCategory))
            return
        }
        if expense.date == nil {
            completion(.failure(.missingDate))
            return
        }
        if expense.amount == nil {
            completion(.failure(.missingAmount))
            return
        }
        completion(.success(expense))
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
