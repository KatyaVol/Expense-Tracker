//
//  CustomButton.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 14.07.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    var buttonTappedCallback: (() -> Void)?
    
    init(title: String) {
        super.init(frame: .zero)
        configureButton(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton(title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Colors.turquoiseColor
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 12
        setTitle(title, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        animateButtonTap(to: 0.4) { [weak self] in
            self?.buttonTappedCallback?()
        }
    }
    
    func animateButtonTap(to alpha: CGFloat, completion: (() -> Void)? = nil) {
        let originalAlpha = self.alpha
        
        UIView.animate(withDuration: 0.2) {
            self.alpha = alpha
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.alpha = originalAlpha
            }
            completion?()
        }
    }
}
