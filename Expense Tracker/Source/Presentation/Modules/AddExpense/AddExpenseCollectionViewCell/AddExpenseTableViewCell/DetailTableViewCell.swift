//
//  DetailTableViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 22.05.2023.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
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
        label.numberOfLines = 0
        return label
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
    
    func setDetailText(_ text: String, for description: String) {
        titleLabel.text = description
        detailLabel.text = text
    }
    
    // MARK: - Private func
    
    private func layout() {
        contentView.addSubview(container)
        container.addSubviews([titleLabel, detailLabel])
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -18),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: detailLabel.leadingAnchor, constant: -106),
            
            
            detailLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            detailLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
            detailLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            detailLabel.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
}
