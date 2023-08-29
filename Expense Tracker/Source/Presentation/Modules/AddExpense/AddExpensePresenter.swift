//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import Foundation

protocol AddExpensePresenterProtocol: AnyObject {
    func categoryImageTapped()
    func dateLabelTapped(cell: DateTableViewCell)
}

final class AddExpensePresenter: AddExpensePresenterProtocol {
  
    // MARK: - Properties
    
    weak var view: AddExpenseViewControllerProtocol?
    var coordinator: AddExpenseCoordinatorProtocol?
    private let dataStore: ExpenseDataStore
    private let storage: CoreDataStorage
    
    // MARK: - Init
    
    init(dataStore: ExpenseDataStore = ExpenseDataStore.shared, storage: CoreDataStorage) {
        self.dataStore = dataStore
        self.storage = storage
        
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
    
    func categoryImageTapped() {
        guard let coordinator = coordinator else { return }
        coordinator.pushCategory(coordinator: coordinator)
    }
    
    func dateLabelTapped(cell: DateTableViewCell) {
        guard let coordinator = coordinator else { return }
        coordinator.showCalendarPopover(coordinator: coordinator, cell: cell)
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
