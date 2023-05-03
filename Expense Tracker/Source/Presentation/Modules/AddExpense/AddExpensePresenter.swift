//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//
import UIKit

protocol AddExpensePresenterProtocol: AnyObject {
    var view: AddExpenseViewControllerProtocol? { get set }
}

final class AddExpensePresenter: AddExpensePresenterProtocol {
    
    // MARK: - Properties
    
    weak var view: AddExpenseViewControllerProtocol?  
}
