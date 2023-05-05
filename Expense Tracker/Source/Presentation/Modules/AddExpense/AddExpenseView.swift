//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 04.05.2023.
//

import UIKit

protocol AddExpenseViewDelegate: AnyObject {
     func didTapSaveButton()
}

final class AddExpenseView: UIView {
    
    // MARK: - UI Elements
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle(Strings.signUpButtonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemMint
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Delegate
    
    private weak var delegate: AddExpenseViewDelegate?
    
    // MARK: - Init
    
    init(delegate: AddExpenseViewDelegate ) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupSubviews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupSubviews() {
        addSubview(saveButton)
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func buttonTapped() {
        delegate?.didTapSaveButton()
    }
}

