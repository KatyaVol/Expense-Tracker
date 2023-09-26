//
//  CalendarPresenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.07.2023.
//

import Foundation

protocol CalendarPresenterProtocol: AnyObject {
    func didTapChooseButton(date: Date)
}

final class CalendarPresenter: CalendarPresenterProtocol {
    
    // MARK: - Properties
    
    weak var view: CalendarViewControllerProtocol?
    private let coordinator: ExpenseCollectionCoordinatorProtocol
    
    // MARK: - Init
    
    init(view: CalendarViewControllerProtocol? = nil,
         coordinator: ExpenseCollectionCoordinatorProtocol) {
        self.view = view
        self.coordinator = coordinator
    }
    
    // MARK: - Internal methods
    
    func didTapChooseButton(date: Date) {
        NotificationCenter.default.post(name: .selectedDate,
                                        object: date)
        coordinator.dismissController(animated: true)
    }
}
