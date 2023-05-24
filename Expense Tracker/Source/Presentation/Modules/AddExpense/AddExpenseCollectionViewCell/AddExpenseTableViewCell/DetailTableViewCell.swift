//
//  DetailTableViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 22.05.2023.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor.customGrayColor
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func layout() {
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            detailLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            detailLabel.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    //MARK: - funk
    
    func setDetailText(_ text: String, for type: ExpenseDetailType) {
        switch type {
        case .date:
            descriptionLabel.text = "Дата"
            detailLabel.text = text
        case .amount:
            descriptionLabel.text = "Сумма"
            detailLabel.text = text == "0" ? "Добавить" : String(format: "%.2f", Double(text) ?? 0.0)
        case .note:
            descriptionLabel.text = "Примечание"
            detailLabel.text = text.isEmpty ? "Добавить" : text
        }
    }
    
    func setDescriptionText(_ text: String) {
        descriptionLabel.text = text
    }
}
