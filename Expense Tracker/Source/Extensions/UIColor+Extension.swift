//
//  UIColor+Extension.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 12.05.2023.
//

import UIKit

extension UIColor {
    
    static func colorWith(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return dark
                default:
                    return light
                }
            }
        } else {
            // Для iOS 12 и ниже просто возвращаем светлый цвет
            return light
        }
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UIColor {
    static let lightTurquoiseColor = UIColor.hexStringToUIColor(hex: "#48CAD2")
    static let darkTurquoiseColor = UIColor.hexStringToUIColor(hex: "#3EB8C0")
    
    static let customGrayColor = UIColor.hexStringToUIColor(hex: "#757070")
}


