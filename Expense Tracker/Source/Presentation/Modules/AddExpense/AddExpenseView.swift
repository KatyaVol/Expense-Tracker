//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 04.05.2023.
//

import UIKit

protocol AddExpenseViewDelegate: AnyObject {
    func didTapSaveButton()
    func didTapCategoryStackView()
    func didTapDateLabel(cell: DateTableViewCell)
    func didPassTextFieldData(text: String?, type: ExpenseDetailType)
}

final class AddExpenseView: UIView {
    
    // MARK: - Private properties
    
    weak var delegate: AddExpenseViewDelegate?
    private let dataStore = ExpenseDataStore.shared
    private lazy var expenseDetails: [[ExpenseDetail]] = dataStore.currentExpenseDetails 
    private var collectionViewBottomConstraint: NSLayoutConstraint?
  
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
    
    private lazy var saveButton: CustomButton = {
        let button = CustomButton(title: LocalizedStrings.saveEntry,
                                  buttonState: .gray)
        button.buttonTappedCallback = { [weak self] in
            self?.delegate?.didTapSaveButton()
        }
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
        label.numberOfLines = 0
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
    
    private lazy var segmentedControl: CustomSegmentedControl = {
        let segmentedControl = CustomSegmentedControl()
        segmentedControl.valueChangedCallBack = { [weak self] index in
            let indexPath = IndexPath(item: index, section: .zero)
            self?.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
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
   
    // MARK: - View Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let distance = calculateDistanceBetweenCollectionAndSaveButton()
        collectionViewBottomConstraint?.constant = -distance
    }
    
    // MARK: - Public methods
  
    func update(with model: [[ExpenseDetail]]) {
        expenseDetails = model
        collectionView.reloadData()
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
    
    private func calculateDistanceBetweenCollectionAndSaveButton() -> CGFloat {
        let distance = safeAreaLayoutGuide.layoutFrame.height - .addLabelTopConstraint -  addLabel.intrinsicContentSize.height - .segmentedControlTopConstraint - .segmentedControlHeight - .collectionViewTopConstraint - CGFloat(expenseDetails[0].count * 60) - .saveButtonHeight - .saveButtonBottom
        return max(distance, 0)
    }
    
    private func setupAutoLayout() {
        
        collectionViewBottomConstraint = collectionView.bottomAnchor.constraint(equalTo: saveButton.topAnchor)
        
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
            
            addLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .addLabelTopConstraint),
            addLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .sideInset),
            addLabel.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -.segmentedControlTopConstraint),
            
            moneyBagImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .moneyBagImageTopConstraint),
            moneyBagImage.leadingAnchor.constraint(equalTo: addLabel.trailingAnchor, constant: .moneyBagImageLeading),
            moneyBagImage.heightAnchor.constraint(equalToConstant: .moneyBagImageHeight),
            
            segmentedControl.topAnchor.constraint(equalTo: moneyBagImage.bottomAnchor, constant: .segmentedControlTopToMoneyBagConstraint),
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .sideInset),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.sideInset),
            segmentedControl.heightAnchor.constraint(equalToConstant: .segmentedControlHeight),
            
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: .collectionViewTopConstraint),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: CGFloat(expenseDetails[0].count * 60)),
            
            collectionViewBottomConstraint!,
            
            saveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -.saveButtonBottom),
            saveButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .sideInset),
            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -.sideInset),
            saveButton.heightAnchor.constraint(equalToConstant: .saveButtonHeight)
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
        return CGSize(width: ScreenSize.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

// MARK: - AddExpenseCollectionViewCellDelegate

extension AddExpenseView: AddExpenseCollectionViewCellDelegate {
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

private extension CGFloat {
    static let addLabelTopConstraint: CGFloat = 37
    static let moneyBagImageHeight: CGFloat = 51
    static let segmentedControlTopConstraint: CGFloat = 35
    static let segmentedControlHeight: CGFloat = 28
    static let collectionViewTopConstraint: CGFloat = 26
    static let saveButtonHeight: CGFloat = 52
    static let saveButtonBottom: CGFloat = 52
    static let sideInset: CGFloat = 19
    static let segmentedControlTopToMoneyBagConstraint: CGFloat = 28
    static let moneyBagImageLeading: CGFloat = 4
    static let moneyBagImageTopConstraint: CGFloat = 26
}
