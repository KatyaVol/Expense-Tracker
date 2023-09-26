//
//  ExpenseCollectionView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 25.09.2023.
//

import UIKit

protocol ExpenseCollectionViewDelegate: AnyObject {
    func didTapCategoryStackView()
    func didTapDateLabel(cell: DateTableViewCell)
    func didPassTextFieldData(text: String?, type: ExpenseDetailType)
}

class ExpenseCollectionView: UIView {
    
    // MARK: - Private properties
    
    weak var delegate: ExpenseCollectionViewDelegate?
    private let dataStore = ExpenseDataStore.shared
    private lazy var expenseDetails: [[ExpenseDetail]] = dataStore.currentExpenseDetails
    
    // MARK: - UI Elements
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(cell: AddExpenseCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    // MARK: - Init
    
    init(delegate: ExpenseCollectionViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.setupSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func update(with model: [[ExpenseDetail]]) {
        self.expenseDetails = model
        self.collectionView.reloadData()
    }
    
    // MARK: - Private methods
    
    private func setupSubviews() {
        addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension ExpenseCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return expenseDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AddExpenseCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        let details = expenseDetails[indexPath.item]
        cell.setExpenseDetails(details)
        cell.delegate = self
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ExpenseCollectionView: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        return CGSize(width: ScreenSize.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

// MARK: - AddExpenseCollectionViewCellDelegate

extension ExpenseCollectionView: AddExpenseCollectionViewCellDelegate {
    func didPassTextFieldData(text: String?, type: ExpenseDetailType) {
        delegate?.didPassTextFieldData(text: text, type: type)
    }
    
    func didTapCategoryStackView() {
        delegate?.didTapCategoryStackView()
    }
    
    func didTapDateLabel(cell: DateTableViewCell) {
        delegate?.didTapDateLabel(cell: cell)
    }
}

