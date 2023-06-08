//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 04.05.2023.
//

import UIKit

protocol AddExpenseViewDelegate: AnyObject {
    func didTapSaveButton()
    func didTapSegmentControl(at index: Int, collectionView: UICollectionView)
}

final class AddExpenseView: UIView {
    
    // MARK: - Private properties
    
    private weak var delegate: AddExpenseViewDelegate?
    private var expenseDetails: [[ExpenseDetail]] = ExpenseDetail.makeExpenseDetails()
    
    // MARK: - UI Elements
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle(Strings.signUpButtonTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.turquoiseColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
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
    
    private let addLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Добавить"
        label.font = UIFont.headerFont
        label.tintColor = .systemBackground
        return label
    }()
    
    private let moneyBagImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "moneyBag"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Доход", "Расход"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()
    
    // MARK: - Init
    
    init(delegate: AddExpenseViewDelegate) {
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
        addSubviews([saveButton, collectionView, addLabel, moneyBagImage, segmentedControl])
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            
            addLabel.topAnchor.constraint(equalTo: topAnchor, constant: 81),
            addLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            addLabel.widthAnchor.constraint(equalToConstant: 168),
            
            moneyBagImage.topAnchor.constraint(equalTo: topAnchor, constant: 73),
            moneyBagImage.leadingAnchor.constraint(equalTo: addLabel.trailingAnchor, constant: 1),
            moneyBagImage.heightAnchor.constraint(equalToConstant: 51),
            
            segmentedControl.topAnchor.constraint(equalTo: moneyBagImage.bottomAnchor, constant: 28),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 26),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: saveButton.topAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func buttonTapped() {
        delegate?.didTapSaveButton()
    }
    
    @objc private func segmentedControlValueChanged(_ segmentedControl: UISegmentedControl) {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        delegate?.didTapSegmentControl(at: selectedIndex, collectionView: collectionView)
    }
}

// MARK: - UICollectionViewDataSource

extension AddExpenseView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return expenseDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AddExpenseCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        let details = expenseDetails[indexPath.item]
        cell.setExpenseDetails(details)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AddExpenseView: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        return CGSize(width: UIScreen.main.bounds.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}
