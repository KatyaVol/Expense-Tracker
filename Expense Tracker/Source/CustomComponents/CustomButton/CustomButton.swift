//
//  CustomButton.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 14.07.2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        configureButton()
    }
    
    private func configureButton() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Colors.turquoiseColor
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 12
    }
    
    func shortChangeAlpha(to alpha: CGFloat) {
        let originalAlpha = self.alpha
        
        UIView.animate(withDuration: 0.2) {
            self.alpha = alpha
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.1) {
            self.alpha = originalAlpha
        }
    }
}
