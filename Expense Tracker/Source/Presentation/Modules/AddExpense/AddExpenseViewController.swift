//
//  View.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

protocol AddExpenseViewControllerProtocol: AnyObject {
   func updateModel(_ model: [[ExpenseDetail]])
}

final class AddExpenseViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let presenter: AddExpensePresenterProtocol
    private lazy var addExpenseView = AddExpenseView(delegate: self)
    
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
        print("Save Button tapped!")
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

// MARK: - AddExpenseViewControllerProtocol

extension AddExpenseViewController: AddExpenseViewControllerProtocol {
    func updateModel(_ model: [[ExpenseDetail]]) {
        addExpenseView.update(with: model)
    }
}


