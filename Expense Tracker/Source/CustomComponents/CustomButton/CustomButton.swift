//
//  CustomButton.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 14.07.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    var title: String
    var buttonTappedCallback: (() -> Void)?
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
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
