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
    func saveButtonTapped()
    func textFieldDataPassed(text: String?, type: ExpenseDetailType)
}

final class AddExpensePresenter: AddExpensePresenterProtocol {
  
    // MARK: - Properties
    
    weak var view: AddExpenseViewControllerProtocol?
    var coordinator: AddExpenseCoordinatorProtocol?
    private let dataStore: ExpenseDataStore
    
    // MARK: - Init
    
    init(dataStore: ExpenseDataStore = ExpenseDataStore.shared) {
        self.dataStore = dataStore
        
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
            if let amount = text {
                dataStore.changeModelWith(amount: amount)
            }
        case .note:
            if let note = text {
                dataStore.changeModelWith(note: note)
            }
        default:
            break
        }
    }
    
    func saveButtonTapped() {
        let updatedDataStoreDetails = dataStore.currentExpenseDetails
        for updatedDataStoreDetail in updatedDataStoreDetails {
            for detail in updatedDataStoreDetail {
                switch detail.type {
                case .category:
                    if let categoryText = detail.text {
                        print("Category text: \(categoryText)")
                    }
                    if let categoryImage = detail.image {
                        print("Category Image: \(categoryImage)")
                    }
                case .date:
                    if let dateValue = detail.text {
                        print("Date: \(dateValue)")
                    }
                case .amount:
                    if let amountValue = detail.text {
                        print("Amount: \(amountValue)")
                    }
                case .note:
                    if let noteValue = detail.text {
                        print("Note: \(noteValue)")
                    }
                }
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
