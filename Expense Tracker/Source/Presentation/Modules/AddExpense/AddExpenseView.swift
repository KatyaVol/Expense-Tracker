//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 04.05.2023.
//

import UIKit

class AddExpenseView: UIView {
    
    // MARK: - UI Elements
    
    let myButton: UIButton = {
        let myButton = UIButton()
        myButton.setTitle(Strings.signUpButtonTitle, for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.backgroundColor = .systemMint
        myButton.setTitleColor(.white, for: .normal)
        return myButton
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupSubviews() {
        addSubview(myButton)
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            myButton.widthAnchor.constraint(equalToConstant: 200),
            myButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
