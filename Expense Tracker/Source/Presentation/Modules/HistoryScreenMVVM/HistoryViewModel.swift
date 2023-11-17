//
//  HistoryViewModel.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 26.10.2023.
//

import Foundation

enum Action {
    case itemSelected(atIndex: Int)
    case itemDeleted(atIndex: Int)
}

enum State {
    case loaded([UserInput])
    case error
}

final class HistoryViewModel {
    
    private let coreDataService: CoreDataStorageProtocol
    private var historyItems: [UserInput] = []
    var stateDidChanged: ((State) -> Void)?
    
    init(coreDataService: CoreDataStorageProtocol) {
        self.coreDataService = coreDataService
    }
    
    var numbersOfItems: Int {
        return historyItems.count
    }
    
    func item(at index: Int) -> UserInput {
        return historyItems[index]
    }
    
    func delete(at index: Int) {
        coreDataService.delete(historyItems[index])
        loadData()
    }
    
    func sendAction(_ action: Action) {
        switch action {
        case .itemSelected(let index):
            print("Item selected at index: \(index)")
        case .itemDeleted(let index):
            delete(at: index)
        }
    }
    
    func loadData() {
        if let data = coreDataService.fetchData() {
            historyItems = data
            notifyStateChange(.loaded(data))
        }
    }
    
    private func notifyStateChange(_ state: State) {
        stateDidChanged?(state)
    }
}
