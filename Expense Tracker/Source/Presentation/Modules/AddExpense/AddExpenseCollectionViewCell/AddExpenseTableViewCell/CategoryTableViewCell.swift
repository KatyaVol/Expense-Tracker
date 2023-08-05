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
        return imageView
    }()
    
    private let categoryImageViewDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor.placeholderText
        return label
    }()
    
    private lazy var categoryImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryImageViewDescription, categoryImageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 4)
        stackView.isLayoutMarginsRelativeArrangement = true
       
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(categoryStackViewTapped))
        stackView.addGestureRecognizer(tapGestureRecognizer)
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.tableViewFont
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
        categoryImageViewDescription.text = expenseDetail.text
    }
    
    // MARK: - Actions
    
    @objc private func categoryStackViewTapped() {
        delegate?.didTapCategoryImage()
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        contentView.addSubview(container)
        container.addSubviews([categoryLabel, categoryImageStackView])
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            categoryImageStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            categoryImageStackView.topAnchor.constraint(equalTo: container.topAnchor),
            
            categoryImageView.widthAnchor.constraint(equalToConstant: 24),
            
            categoryImageViewDescription.topAnchor.constraint(equalTo: categoryLabel.topAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            categoryLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -18),
            categoryLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 4),
            categoryLabel.trailingAnchor.constraint(equalTo: categoryImageView.leadingAnchor, constant: 106)
        ])
    }
}
