//
//  AddExpenseView+Extension.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 20.05.2023.
//

import UIKit

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
