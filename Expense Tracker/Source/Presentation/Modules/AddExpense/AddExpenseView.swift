//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 04.05.2023.
//

import UIKit

protocol AddExpenseViewDelegate: AnyObject {
    func didTapSaveButton()
}

final class AddExpenseView: UIView {
    
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
        collectionView.backgroundColor = .red
        collectionView.register(AddExpenseCollectionViewCell.self,
                                forCellWithReuseIdentifier: "AddExpenseCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Delegate
    
    private weak var delegate: AddExpenseViewDelegate?
    
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
    
    // MARK: - Private func
    
    private func setupSubviews() {
        addSubview(saveButton)
        addSubview(collectionView)
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc private func buttonTapped() {
        delegate?.didTapSaveButton()
    }
}

// MARK: - UICollectionViewDataSource

extension AddExpenseView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "AddExpenseCollectionViewCell",
            for: indexPath) as! AddExpenseCollectionViewCell
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AddExpenseView: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat {return 10 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height - inset * 2
        return CGSize(width: height * 2, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset,
                     left: inset,
                     bottom: inset,
                     right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       inset
    }

}
