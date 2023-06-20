//
//  AddExpenseTableViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 22.05.2023.
//

import UIKit

protocol CategoryTableViewCellDelegate: AnyObject {
    func didTapCategoryImage()
}

final class CategoryTableViewCell: UITableViewCell {
    
    // MARK: - Internal properties
    
    weak var delegate: CategoryTableViewCellDelegate?
    
    // MARK: - Private properties
    
    private var expenseDetail: ExpenseDetail?

    // MARK: - UI Elements
    
    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemBackground
        imageView.contentMode = .scaleAspectFit
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(categoryImageViewTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
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
    
    //MARK: - Public Methods
    
    func setCategoryImage(expenseDetail: ExpenseDetail) {
        categoryLabel.text = expenseDetail.title
        categoryImageView.image = expenseDetail.image?.withRenderingMode(.alwaysTemplate)
        categoryImageView.tintColor = Colors.elementsGrayColor
    }
    
    // MARK: - Actions
    
    @objc private func categoryImageViewTapped() {
        delegate?.didTapCategoryImage()
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        contentView.addSubview(container)
        container.addSubviews([categoryImageView, categoryLabel])
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            categoryImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 6),
            categoryImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -14),
            categoryImageView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -2),
            categoryImageView.widthAnchor.constraint(equalToConstant: 24),
            
            categoryLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            categoryLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -18),
            categoryLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: categoryImageView.leadingAnchor, constant: 106)
        ])
    }
}
