//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//
import UIKit

protocol AddExpensePresenterProtocol: AnyObject {
    func categoryImageTapped()
}

final class AddExpensePresenter: AddExpensePresenterProtocol {
    
    // MARK: - Properties
    
    weak var view: AddExpenseViewControllerProtocol?
    var coordinator: AddExpenseCoordinatorProtocol?
    
    // MARK: - Internal methods
    
    internal func categoryImageTapped() {
        let categoryPresenter = CategoryPresenter()
        let categoryViewController = CategoryViewController(presenter: categoryPresenter)
        coordinator?.pushController(categoryViewController, animated: true)
    }
}
