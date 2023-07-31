//
//  DetailTableViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 22.05.2023.
//

import UIKit

protocol DateTableViewCellDelegate: AnyObject {
    func didTapDateLabel(cell: DateTableViewCell)
}

final class DateTableViewCell: UITableViewCell {
    
    // MARK: - Internal properties
    
    weak var delegate: DateTableViewCellDelegate?
    
    // MARK: - Private properties
    
    private var expenseDetail: ExpenseDetail?
    
    // MARK: - UI Elements
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.tableViewFont
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.tableViewFont
        label.textColor = UIColor.customGrayColor
        label.textAlignment = .right
        label.numberOfLines = 0
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(dateLabelTapped))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleDateChosen(_:)), name: .dateWasChosen, object: nil)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func setDateText(expenseDetail: ExpenseDetail) {
        titleLabel.text = expenseDetail.title
        dateLabel.text = expenseDetail.text
        dateLabel.textColor =  UIColor.placeholderText
    }
    
    // MARK: - Private func
    
    private func layout() {
        contentView.addSubview(container)
        container.addSubviews([titleLabel, dateLabel])
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -18),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -106),
            
            dateLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            dateLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
            dateLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            dateLabel.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    // MARK: - Action
    
    @objc private func dateLabelTapped() {
        delegate?.didTapDateLabel(cell: self)
    }
    
    @objc private func handleDateChosen(_ notification: Notification) {
        if let date = notification.object as? Date {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.YYYY"
            let string = formatter.string(from: date)
            dateLabel.text = string
        }
    }
}
