//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import Foundation

protocol AddExpensePresenterProtocol: AnyObject {
    func saveButtonTapped()
    func printFetchedDataFromCoreData()
    func validateAndProcessExpense()
}

final class AddExpensePresenter: AddExpensePresenterProtocol {
    
    // MARK: - Properties
    
    weak var view: AddExpenseViewControllerProtocol?
    var coordinator: ExpenseCollectionCoordinatorProtocol?
    private let dataStore: ExpenseDataStore
    private let coreDataStorage: CoreDataStorage
    
    // MARK: - Init
    
    init(dataStore: ExpenseDataStore = ExpenseDataStore.shared, coreDataStorage: CoreDataStorage) {
        self.dataStore = dataStore
        self.coreDataStorage = coreDataStorage
    }
    
    // MARK: - Internal methods
    
    func saveButtonTapped() {
        guard let expense = dataStore.getCurrentExpense(),
              let category = expense.category,
              let date = expense.date,
              let amount = expense.amount
             // let note = expense.note

        else { return }
        
        let formattedDate = DateFormatter.dateString(from: date)
        
        print("Amount: \(amount)")
        print("Date: \(formattedDate)")
        print("Category: \(String(describing: category.text)), Image: \(String(describing: category.image))")
        print("Note: \(expense.note ?? "")")
        
        coreDataStorage.saveData(expense: expense)
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
    
    func printFetchedDataFromCoreData() {
        guard let fetchedData = coreDataStorage.fetchData() else {
            print("No data fetched from CoreData")
            return
        }
        view?.printFetchedDataFromCoreData(fetchedData)
    }
}
