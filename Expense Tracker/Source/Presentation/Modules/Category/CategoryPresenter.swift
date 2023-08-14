//
//  CategoryPresenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//
import Foundation

protocol CategoryPresenterProtocol: AnyObject {
    func didSelectCategory(at category: Category)
}

final class CategoryPresenter: CategoryPresenterProtocol {
    
    // MARK: - Properties
    
    weak var view: CategoryViewControllerProtocol?
    private let coordinator: AddExpenseCoordinatorProtocol
    
    // MARK: - Init
    
    init(view: CategoryViewControllerProtocol? = nil,
         coordinator: AddExpenseCoordinatorProtocol) {
        self.view = view
        self.coordinator = coordinator
    }
    
    // MARK: - Internal methods
    
    func didSelectCategory(at category: Category) {
        NotificationCenter.default.post(name: .selectedCategory,
                                        object: category)
        coordinator.popController(animated: true)
    }
}


