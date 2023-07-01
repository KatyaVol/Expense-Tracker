//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//
import Foundation

protocol AddExpensePresenterProtocol: AnyObject {
    func categoryImageTapped()
}

final class AddExpensePresenter: AddExpensePresenterProtocol {
    
    // MARK: - Properties
    
    weak var view: AddExpenseViewControllerProtocol?
    var coordinator: AddExpenseCoordinatorProtocol?
    
    // MARK: - Internal methods
    
    func categoryImageTapped() {
        coordinator?.pushCategory()
    }
}
