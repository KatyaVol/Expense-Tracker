//
//  UIFonts+Extension.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 08.06.2023.
//

import UIKit

extension UIFont {
    static var headerFont: UIFont {
        return UIFont.systemFont(ofSize: 32, weight: .bold)
    }
    
    static var segmentedControlFont: UIFont {
            return UIFont.systemFont(ofSize: 15)
        }
    
    static var tableViewFont: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    
    static var smallTextFont: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .light)
    }
}
