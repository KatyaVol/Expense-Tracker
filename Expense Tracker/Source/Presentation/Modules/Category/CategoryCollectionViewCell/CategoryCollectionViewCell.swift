//
//  CategoryCollectionViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
        setupSubviews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Public Methods
    
    public func setCategory (_ category: Category) {
        categoryImageView.image = category.image?.withRenderingMode(.alwaysTemplate)
        categoryImageView.tintColor = Colors.whiteAndBlack
        categoryLabel.text = category.text
    }
    
    //    MARK: - Private Methods
    
    private func customizeCell() {
        contentView.layer.cornerRadius = 20.0
        contentView.layer.borderWidth = 2.0
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = Colors.categoryCellColor
        updateBorderColor()
    }
    
    private func updateBorderColor() {
        let borderColor = traitCollection.userInterfaceStyle == .dark ? UIColor.darkTurquoiseColor : Colors.categoryCellBorderColor
        contentView.layer.borderColor = borderColor.cgColor
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateBorderColor()
        }
    }

    private func setupSubviews() {
        contentView.addSubviews([categoryImageView,
                                 categoryLabel])
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            categoryImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -28),
            
            categoryLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 3),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4)
        ])
    }
}

