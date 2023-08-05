//
//  View.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

protocol AddExpenseViewControllerProtocol: AnyObject {
    func updateCategory(_ category: Category)
    func updateDate(_ date: Date)
}

final class AddExpenseViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let presenter: AddExpensePresenterProtocol
    private lazy var expenseDetails: [[ExpenseDetail]] = ExpenseDetail.makeExpenseDetails()
    private lazy var addExpenseView = AddExpenseView(delegate: self, expenseDetails: expenseDetails)
    
    
    // MARK: - Init
    
    init(presenter: AddExpensePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        view = addExpenseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
    }
}

// MARK: - AddExpenseViewDelegate

extension AddExpenseViewController: AddExpenseViewDelegate {
    
    func didTapSaveButton() {
        print("Button tapped!")
    }
}

// MARK: - AddExpenseCollectionViewCellDelegate

extension AddExpenseViewController: AddExpenseCollectionViewCellDelegate {
    
    func didTapCategoryImage() {
        presenter.categoryImageTapped()
    }
    
    func didTapDateLabel(cell: DateTableViewCell) {
        presenter.dateLabelTapped(cell: cell)
    }
}

extension AddExpenseViewController: AddExpenseViewControllerProtocol {
    func updateCategory(_ category: Category) {
        addExpenseView.updateCategory(category)
    }
    
    func updateDate(_ date: Date) {
        addExpenseView.updateDate(date)
    }
}

