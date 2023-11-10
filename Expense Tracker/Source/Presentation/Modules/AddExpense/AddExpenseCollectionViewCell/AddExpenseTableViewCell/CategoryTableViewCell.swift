//
//  AddExpenseTableViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 22.05.2023.
//

import UIKit

protocol CategoryTableViewCellDelegate: AnyObject {
    func didTapCategoryStackView()
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
    
    private let categoryLabelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textColor = UIColor.placeholderText
        return label
    }()
    
    private lazy var categoryImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [categoryLabelDescription, categoryImageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = .spacing10
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: .spacing10,
                                               left: .spacing10,
                                               bottom: .spacing10,
                                               right: .spacing4)
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
        label.numberOfLines = .zero
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
        self.expenseDetail = expenseDetail
        categoryLabel.text = expenseDetail.title
        categoryImageView.image = expenseDetail.image?.withRenderingMode(.alwaysTemplate)
        categoryImageView.tintColor = Colors.elementsGrayColor
        categoryLabelDescription.text = expenseDetail.text
    }
    
    // MARK: - Actions
    
    @objc private func categoryStackViewTapped() {
        delegate?.didTapCategoryStackView()
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        contentView.addSubview(container)
        container.addSubviews([categoryLabel, categoryImageStackView])
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .spacing16),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.spacing16),
            
            categoryImageStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            categoryImageStackView.topAnchor.constraint(equalTo: container.topAnchor),
            
            categoryImageView.widthAnchor.constraint(equalToConstant: .spacing24),
            
            categoryLabelDescription.topAnchor.constraint(equalTo: categoryLabel.topAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: .spacing10),
            categoryLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -.spacing18),
            categoryLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: .spacing4),
            categoryLabel.trailingAnchor.constraint(equalTo: categoryImageView.leadingAnchor, constant: .spacing106)
        ])
    }
}
