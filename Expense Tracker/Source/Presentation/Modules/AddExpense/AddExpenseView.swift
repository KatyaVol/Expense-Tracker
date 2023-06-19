//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 04.05.2023.
//

import UIKit

protocol AddExpenseViewDelegate: AnyObject {
    func didTapSaveButton()
    func didTapCategoryImage()
    func didTapDateLabel()
}

final class AddExpenseView: UIView {
    
    // MARK: - Private properties
    
    private weak var delegate: AddExpenseViewDelegate?
    private var expenseDetails: [[ExpenseDetail]] = ExpenseDetail.makeExpenseDetails()
    
    // MARK: - UI Elements
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle(LocalizedStrings.saveEntry, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.turquoiseColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(buttonTapped),
                         for: .touchUpInside)
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
        label.text = LocalizedStrings.add
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
        let segmentedControl = UISegmentedControl(items: [
            LocalizedStrings.income,
            LocalizedStrings.expense
        ])
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.segmentedControlFont], for: .normal)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self,
                                   action: #selector(segmentedControlValueChanged(_:)),
                                   for: .valueChanged)
        return segmentedControl
    }()
    
    // MARK: - Init
    
    init(delegate: AddExpenseViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupSubviews()
        setupAutoLayout()
        setupNotifications()
        addTapGestureToEndEditing()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([saveButton,
                                 collectionView,
                                 addLabel,
                                 moneyBagImage,
                                 segmentedControl])
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            addLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 34),
            addLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addLabel.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -35),
            
            moneyBagImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26),
            moneyBagImage.leadingAnchor.constraint(equalTo: addLabel.trailingAnchor, constant: 4),
            moneyBagImage.heightAnchor.constraint(equalToConstant: 51),
            
            segmentedControl.topAnchor.constraint(equalTo: moneyBagImage.bottomAnchor, constant: 28),
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 28),
            
            saveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -52),
            saveButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 52),
            
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 26),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: CGFloat(expenseDetails[0].count * 60)),
            collectionView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: (safeAreaLayoutGuide.layoutFrame.height - addLabel.frame.height - segmentedControl.frame.height - collectionView.frame.height - saveButton.frame.height))
        ])
    }
    private func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Actions
    
    @objc private func buttonTapped() {
        delegate?.didTapSaveButton()
    }
    
    @objc private func segmentedControlValueChanged(_ segmentedControl: UISegmentedControl) {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        let indexPath = IndexPath(item: selectedIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
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
        cell.delegate = self
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

// MARK: - AddExpenseCollectionViewCellDelegate

extension AddExpenseView: AddExpenseCollectionViewCellDelegate {
    func didTapCategoryImage() {
        delegate?.didTapCategoryImage()
    }
    
    func didTapDateLabel() {
        delegate?.didTapDateLabel()
    }
}

