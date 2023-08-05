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
    
    // MARK: - Internal methods
    
    func didSelectCategory(at category: Category) {
        view?.didSelectCategory(at: category)
        
        NotificationCenter.default.post(name: .selectedCategory,
                                        object: category)
    }
}
