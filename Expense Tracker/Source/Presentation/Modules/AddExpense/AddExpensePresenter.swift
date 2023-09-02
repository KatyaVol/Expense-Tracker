//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import Foundation

protocol AddExpensePresenterProtocol: AnyObject {
    func categoryStackViewTapped()
    func dateLabelTapped(cell: DateTableViewCell)
    func categoryDataPassed(with expenseDetail: ExpenseDetail)
    func saveButtonTapped()
}

final class AddExpensePresenter: AddExpensePresenterProtocol {
  
    // MARK: - Properties
    
    weak var view: AddExpenseViewControllerProtocol?
    var coordinator: AddExpenseCoordinatorProtocol?
    private let dataStore: ExpenseDataStore
    private let storage: CoreDataStorageProtocol
    
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
    
    func categoryStackViewTapped() {
        guard let coordinator = coordinator else { return }
        coordinator.pushCategory(coordinator: coordinator)
    }
    
    func dateLabelTapped(cell: DateTableViewCell) {
        guard let coordinator = coordinator else { return }
        coordinator.showCalendarPopover(coordinator: coordinator, cell: cell)
    }
    
    func categoryDataPassed(with expenseDetail: ExpenseDetail) {
        // Выводим текст в консоль
        if let textValue = expenseDetail.text {
            print("Category Text in Presentor : \(textValue)")
        } else {
            print("Category Text in Presentor : None")
        }
        
        // Выводим описание картинки в консоль
        if let imageValue = expenseDetail.image {
            print("Category Image Description in Presentor : \(imageValue.description)")
        } else {
            print("Category Image Description in Presentor : None")
        }
    }
    
    func saveButtonTapped() {
        let currentExpenseDetails = dataStore.currentExpenseDetails
        for expenseDetailArray in currentExpenseDetails {
            for detail in expenseDetailArray {
                if let textValue = detail.text, detail.type == .category {
                    print("Category Text in Presenter: \(textValue)")
                }
                if let imageValue = detail.image {
                    print("Category Image Description in Presenter: \(imageValue.description)")
                }
            }
        }
    }
    
    // MARK: - Private methods
    
    private func updateCategory(_ category: Category) {
        print("Before update:")
        print(dataStore.currentExpenseDetails.description)
        print("--------------------------")
    
        
        dataStore.changeModelWith(category: category)
        
        // Выводим информацию после обновления
        print("After update:")
        print(dataStore.currentExpenseDetails.description)
        print("--------------------------")
        
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
