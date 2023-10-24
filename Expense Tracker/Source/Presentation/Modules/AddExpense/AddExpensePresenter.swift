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
        guard let expense = dataStore.getCurrentExpense() else { return }
        
        guard let category = expense.category else { return }
        print("Category: \(String(describing: category.text)), Image: \(String(describing: category.image))")
        
        guard let date = expense.date else { return }
        let formattedDate = DateFormatter.dateString(from: date)
        print("Date: \(formattedDate)")
        
        guard let amount = expense.amount else { return }
        print("Amount: \(amount)")
        
        guard let note = expense.note else { return }
        print("Note: \(note)")
        
        coreDataStorage.saveData(expense: expense)
    }
    
    func printFetchedDataFromCoreData() {
        guard let fetchedData = coreDataStorage.fetchData() else {
            print("No data fetched from CoreData")
            return
        }
        view?.printFetchedDataFromCoreData(fetchedData)
    }
}
