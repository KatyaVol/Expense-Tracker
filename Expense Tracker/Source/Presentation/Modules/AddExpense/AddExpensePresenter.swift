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
    
    init() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateCategoryImage(_:)),
                                               name: .selectedCategory,
                                               object: nil)
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleSelectedDate(_:)),
                                               name: .selectedDate,
                                               object: nil)
    }
    
    @objc private func updateCategoryImage(_ notification: Notification) {
        guard let category = notification.object as? Category else { return }
        view?.updateCategory(category)
    }
    
    @objc private func handleSelectedDate(_ notification: Notification) {
        guard let date = notification.object as? Date else { return }
        view?.updateDate(date)
    }
    
    // MARK: - Internal methods
    
    func categoryImageTapped() {
        guard let coordinator = coordinator else { return }
        coordinator.pushCategory(coordinator: coordinator)
    }
    
    func dateLabelTapped(cell: DateTableViewCell) {
        guard let coordinator = coordinator else { return }
        coordinator.showCalendarPopover(coordinator: coordinator,
                                        cell: cell)
    }
}
