//
//  HistoryViewModel.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 26.10.2023.
//

import Foundation

protocol IHistoryViewModel {
    var numbersOfItems: Int { get }
    var stateDidChanged: ((State) -> Void)? { get set }
    func item(at index: Int) -> UserInput
    func changeState(_ action: Action)
    func loadData()
}

enum Action {
    case itemSelected(atIndex: Int)
    case itemDeleted(atIndex: Int)
}

enum State {
    case loading
    case loaded([UserInput])
    case error([HistoryViewModelError])
}

enum HistoryViewModelError: Error {
    case dataLoadFailure
    case unknownError
}

final class HistoryViewModel: IHistoryViewModel {
    
    // MARK: - Private Properties
    
    private let coreDataService: CoreDataStorageProtocol
    private var historyItems: [UserInput] = []
    private var state: State = .loading {
        didSet {
            stateDidChanged?(state)
        }
    }
    
    // MARK: - Init
    
    init(coreDataService: CoreDataStorageProtocol) {
        self.coreDataService = coreDataService
    }
    
    // MARK: - Properties
    
    var stateDidChanged: ((State) -> Void)?
    var numbersOfItems: Int {
        return historyItems.count
    }
    
    // MARK: - Puplic Methods
    
    func item(at index: Int) -> UserInput {
        return historyItems[index]
    }
    
    func changeState(_ action: Action) {
        switch action {
        case .itemSelected(let index):
            print("Item selected at index: \(index)")
        case .itemDeleted(let index):
            delete(at: index)
        }
    }
    
    func loadData() {
        historyItems = []
        notifyStateChange(.loading)
        
        if let data = coreDataService.fetchData() {
            historyItems = data
            notifyStateChange(.loaded(data))
        } else {
            notifyStateChange(.error([HistoryViewModelError.dataLoadFailure]))
        }
    }
    
    // MARK: - Private Properties
    
    private func notifyStateChange(_ state: State) {
        stateDidChanged?(state)
    }
    
    // этот метод в теории может вернуть ошибку при сохранении контекста и надо бы обработать негативный кейс
    
    private func delete(at index: Int) {
        coreDataService.delete(historyItems[index])
        loadData()
    }
}
