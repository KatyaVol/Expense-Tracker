//
//  CategoryView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//

import UIKit

protocol CategoryViewDelegate: AnyObject {
    func didSelectCategory(at category: Category)
}

final class CategoryView: UIView {
    
    // MARK: - Private properties
    
    private weak var delegate: CategoryViewDelegate?
    private let categories: [Category] = Category.makeCategory()
   
    // MARK: - UI Elements
    
    private let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
            descriptionLabel.bottomAnchor.constraint(equalTo: coinImageView.bottomAnchor, constant: -51),
            descriptionLabel.trailingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: -4),
            
            collectionView.topAnchor.constraint(equalTo: coinImageView.bottomAnchor, constant: 12),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
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
        let category = categories[indexPath.item]
        cell.setCategory(category)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CategoryView: UICollectionViewDelegateFlowLayout {
    
    private var spaceBetweenRows: CGFloat { return 14 }
    private var spaceBetweenCell: CGFloat { return 15 }
    private var sideInset: CGFloat { return 16 }
    private var numberOfItemsPerRow: CGFloat { return 4 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - (sideInset * 2) - (spaceBetweenCell * 3)) / numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spaceBetweenRows
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spaceBetweenCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0,
                     left: sideInset,
                     bottom: 0,
                     right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.item]
        delegate?.didSelectCategory(at: category)
        print("cell tapped Item \(indexPath.item)")
    }
}

