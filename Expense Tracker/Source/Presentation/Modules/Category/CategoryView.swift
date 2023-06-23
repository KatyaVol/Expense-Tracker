//
//  CategoryView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//

import UIKit

protocol CategoryViewDelegate: AnyObject {}

final class CategoryView: UIView {
    
    // MARK: - Private properties
    
    private weak var delegate: CategoryViewDelegate?
    private var categories: [Category] = Category.makeCategory()
    
    // MARK: - UI Elements
    
    private let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "MONETS_GROUP")
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LocalizedStrings.categories
        label.font = .headerFont
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LocalizedStrings.chooseCategory
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(cell: CategoryCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Init
    
    init(delegate: CategoryViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupSubviews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // MARK: - Private methods
    
    private func setupSubviews() {
        addSubviews([coinImageView,
                     headerLabel,
                     descriptionLabel,
                     collectionView])
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            
            coinImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            coinImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            coinImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            coinImageView.heightAnchor.constraint(equalToConstant: 195),
            
            headerLabel.topAnchor.constraint(equalTo: coinImageView.topAnchor, constant: 22),
            headerLabel.leadingAnchor.constraint(equalTo: coinImageView.leadingAnchor, constant: 4),
            
            descriptionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 42),
            descriptionLabel.leadingAnchor.constraint(equalTo: coinImageView.leadingAnchor, constant: 4),
            descriptionLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor, constant: -58),
            descriptionLabel.leadingAnchor.constraint(equalTo: coinImageView.leadingAnchor, constant: -4),
            
            collectionView.topAnchor.constraint(equalTo: coinImageView.bottomAnchor, constant: 12),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension CategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        
        cell.layer.cornerRadius = 20.0
        cell.layer.borderWidth = 2.0
        cell.layer.masksToBounds = true
        cell.backgroundColor = Colors.categoryCellColor
        cell.setBorderColor(Colors.categoryCellBorderColor)
        
        let category = categories[indexPath.item]
        cell.setCategory(category)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CategoryView: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 15 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 32
        let height = collectionView.bounds.height
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/4, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
