//
//  ExpenseCollectionViewController.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 24.09.2023.
//

import UIKit

protocol ExpenseCollectionViewControllerProtocol: AnyObject {
    func updateModel(_ model: [[ExpenseDetail]])
    func showValidationError(error: ExpenseValidationError)
}

protocol Scrollable {
    func scrollTo(index: Int, animated: Bool)
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
    func didTapSaveButton() {
        presenter.validateAndProcessExpense()
    }
    
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
    
    func showValidationError(error: ExpenseValidationError) {
        let alert = UIAlertController(title: "\(LocalizedStrings.alert)",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension ExpenseCollectionViewController: Scrollable {
    func scrollTo(index: Int, animated: Bool) {
        let indexPath = IndexPath(item: index, section: .zero)
        expenseCollectionView.scrollToItem(at: indexPath,
                                           at: .centeredHorizontally,
                                           animated: animated)
    }
}
