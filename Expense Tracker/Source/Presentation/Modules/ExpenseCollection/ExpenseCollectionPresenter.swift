//
//  ExpenseCollectionPresenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 25.09.2023.
//

import Foundation

protocol ExpenseCollectionPresenterProtocol: AnyObject{
    func categoryStackViewTapped()
    func dateLabelTapped(cell: DateTableViewCell)
    func textFieldDataPassed(text: String?, type: ExpenseDetailType)
    func validateAndProcessExpense()
}

final class ExpenseCollectionPresenter: ExpenseCollectionPresenterProtocol {
    
    // MARK: - Properties
    
    weak var view: ExpenseCollectionViewControllerProtocol?
    var coordinator: ExpenseCollectionCoordinatorProtocol?
    
    // MARK: - Private properties
    
    private let dataStore: ExpenseDataStore
    private let coreDataStorage: CoreDataStorage
    
    // MARK: - Init
    
    init(dataStore: ExpenseDataStore = ExpenseDataStore.shared, coreDataStorage: CoreDataStorage) {
        self.dataStore = dataStore
        self.coreDataStorage = coreDataStorage
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateCategoryImage(_:)),
                                               name: .selectedCategory,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleSelectedDate(_:)),
                                               name: .selectedDate,
                                               object: nil)
    }
    
    // MARK: - Internal methods
    
    func categoryStackViewTapped() {
        guard let coordinator = coordinator else { return }
        coordinator.pushCategory(coordinator: coordinator)
    }
    
    func dateLabelTapped(cell: DateTableViewCell) {
        guard let coordinator = coordinator else { return }
        coordinator.showCalendarPopover(coordinator: coordinator, cell: cell)
    }
    
    func textFieldDataPassed(text: String?, type: ExpenseDetailType) {
        switch type {
        case .amount:
            guard let amount = text else { return }
            dataStore.changeModelWith(amount: amount)
        case .note:
            guard let note = text else { return }
            dataStore.changeModelWith(note: note)
        default:
            break
        }
    }
    
    func validateAndProcessExpense() {
        guard let expense = ExpenseDataStore.shared.getCurrentExpense() else { return }
        
        ExpenseValidator.validate(expense: expense) { result in
            switch result {
            case .success(let validExpense):
                print("\(validExpense) data ready for saving")
            case .failure(let error):
                view?.showValidationError(error: error)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func updateCategory(_ category: Category) {
        dataStore.changeModelWith(category: category)
        let updatedModel = dataStore.currentExpenseDetails
        view?.updateModel(updatedModel)
    }
    
    private func updateDate(_ date: Date) {
        dataStore.changeModelWith(date: date)
        let updatedModel = dataStore.currentExpenseDetails
        view?.updateModel(updatedModel)
    }
    
    private func updateAmount(_ amount: String) {
        dataStore.changeModelWith(amount: amount)
        let updatedModel = dataStore.currentExpenseDetails
        view?.updateModel(updatedModel)
    }
    
    private func updateNote(_ note: String) {
        dataStore.changeModelWith(note: note)
        let updatedModel = dataStore.currentExpenseDetails
        view?.updateModel(updatedModel)
    }
    
    // MARK: - Actions
    
    @objc private func updateCategoryImage(_ notification: Notification) {
        guard let category = notification.object as? Category else { return }
        updateCategory(category)
    }
    
    @objc private func handleSelectedDate(_ notification: Notification) {
        guard let date = notification.object as? Date else { return }
        updateDate(date)
    }
}
