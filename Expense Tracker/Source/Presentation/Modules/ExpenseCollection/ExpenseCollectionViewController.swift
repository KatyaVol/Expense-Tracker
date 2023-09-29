//
//  ExpenseCollectionViewController.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 24.09.2023.
//

import UIKit

protocol ExpenseCollectionViewControllerProtocol: AnyObject {
    func updateModel(_ model: [[ExpenseDetail]])
}

final class ExpenseCollectionViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let presenter: ExpenseCollectionPresenterProtocol
    private lazy var expenseCollectionView = ExpenseCollectionView(delegate: self)
    
    // MARK: - Init
    
    init(presenter: ExpenseCollectionPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        view = expenseCollectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
    }
}

// MARK: - AddExpenseCollectionViewCellDelegate

extension ExpenseCollectionViewController: ExpenseCollectionViewDelegate {
    func didTapCategoryStackView() {
        presenter.categoryStackViewTapped()
    }
    
    func didTapDateLabel(cell: DateTableViewCell) {
        presenter.dateLabelTapped(cell: cell)
    }
    
    func didPassTextFieldData(text: String?, type: ExpenseDetailType) {
        presenter.textFieldDataPassed(text: text, type: type)
    }
}

// MARK: - ExpenseCollectionViewControllerProtocol

extension ExpenseCollectionViewController: ExpenseCollectionViewControllerProtocol {
    func updateModel(_ model: [[ExpenseDetail]]) {
        expenseCollectionView.update(with: model)
    }
}
