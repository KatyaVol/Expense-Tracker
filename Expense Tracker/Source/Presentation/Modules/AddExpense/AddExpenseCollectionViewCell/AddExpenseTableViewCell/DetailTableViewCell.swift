//
//  DetailTableViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 14.06.2023.
//


import UIKit

final class DetailTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private var expenseDetail: ExpenseDetail?
    
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.tableViewFont
        return label
    }()
    
    private lazy var detailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemBackground
        textField.font = UIFont.tableViewFont
        textField.textColor = UIColor.customGrayColor
        textField.textAlignment = .right
        return textField
    }()
    
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func setDetailText(expenseDetail: ExpenseDetail) {
        titleLabel.text = expenseDetail.title
        detailTextField.placeholder = expenseDetail.text
        
        if expenseDetail.type == .amount {
            detailTextField.keyboardType = .decimalPad
        } else {
            detailTextField.keyboardType = .default
        }
    }
    
    // MARK: - Private func
    
    private func layout() {
        contentView.addSubview(container)
        container.addSubviews([titleLabel,
                               detailTextField])
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -18),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: detailTextField.leadingAnchor, constant: -106),
            
            detailTextField.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            detailTextField.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
            detailTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            detailTextField.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
}

extension DetailTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}

