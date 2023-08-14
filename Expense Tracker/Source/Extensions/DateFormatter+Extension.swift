//
//  DateFormatter+Extensions.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 02.08.2023.
//

import Foundation

extension DateFormatter {
    static func dateString(from date: Date, format: String = "dd.MM.YYYY") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
