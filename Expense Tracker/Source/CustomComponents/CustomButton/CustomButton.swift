//
//  CustomButton.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 14.07.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    // MARK: - Properties
    
    var buttonTappedCallback: (() -> Void)?
    
    enum ButtonState {
        case turquiose
        case gray
    }
    
    // MARK: - Init
    
    init(title: String, buttonState: ButtonState) {
        super.init(frame: .zero)
        configureButton(title: title, buttonState: buttonState )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureButton(title: String, buttonState: ButtonState) {
        translatesAutoresizingMaskIntoConstraints = false
        
        switch buttonState {
        case .turquiose:
            backgroundColor = Colors.turquoiseColor
        case .gray:
            backgroundColor = Colors.buttonGrayColor
        }
        
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
    
    private func animateButtonTap(to alpha: CGFloat, completion: (() -> Void)? = nil) {
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
