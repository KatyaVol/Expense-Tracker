//
//  DetailTableViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 14.06.2023.
//

import UIKit

protocol DetailTableViewCellDelegate: AnyObject {
    func didPassTextFieldData(text: String?, type: ExpenseDetailType)
}

final class DetailTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private var expenseDetail: ExpenseDetail?
    weak var delegate: DetailTableViewCellDelegate?

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
        textField.delegate = self
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
        self.expenseDetail = expenseDetail
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
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .spacing20),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .spacing16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.spacing16),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: .spacing10),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -.spacing18),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: .spacing4),
            titleLabel.trailingAnchor.constraint(equalTo: detailTextField.leadingAnchor, constant: -.spacing106),
            
            detailTextField.topAnchor.constraint(equalTo: container.topAnchor, constant: .spacing8),
            detailTextField.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -.spacing16),
            detailTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -.spacing2),
            detailTextField.widthAnchor.constraint(equalToConstant: .spacing110)
        ])
    }
}

extension DetailTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let detailType = expenseDetail?.type else { return }
        delegate?.didPassTextFieldData(text: textField.text, type: detailType)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}

