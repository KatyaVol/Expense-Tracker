//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//
import UIKit

protocol AddExpensePresenterProtocol: AnyObject {}

final class AddExpensePresenter: AddExpensePresenterProtocol {
    
    // MARK: - Private properties
    
     weak var view: AddExpenseViewControllerProtocol?
}
