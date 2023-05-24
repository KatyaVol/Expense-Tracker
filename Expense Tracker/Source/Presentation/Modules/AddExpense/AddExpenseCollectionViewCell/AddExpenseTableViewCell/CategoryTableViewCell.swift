//
//  AddExpenseTableViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 22.05.2023.
//

import   UIKit

final class CategoryTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = . white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Категория"
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
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
        contentView.addSubview(categoryImageView)
        contentView.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            categoryImageView.widthAnchor.constraint(equalToConstant: 24),
            
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }
    
    //MARK: - func
    
    func setCategoryImage(_ image: UIImage) {
        categoryImageView.image = image
    }
}
