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
    
    func addTapGestureToEndEditing() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(UIView.endEditing(_:)))
        addGestureRecognizer(tapGestureRecognizer)
    }
}

extension UIView {
    func setBorderColor(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            layer.borderColor = color.resolvedColor(with: self.traitCollection).cgColor
        } else {
            layer.borderColor = color.cgColor
        }
    }
}
