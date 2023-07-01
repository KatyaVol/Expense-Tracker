//
//  CategoryPresenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//
import Foundation

protocol CategoryPresenterProtocol: AnyObject {
    func didSelectCategory(at index: Int)
}

final class CategoryPresenter: CategoryPresenterProtocol {
    
    // MARK: - Properties
    
    weak var view: CategoryViewControllerProtocol?
    
    // MARK: - Internal methods
    
    func didSelectCategory(at index: Int) {
        let section = 0

        view?.didSelectCategory(at: index)
        print("category cell tapped \(section), \(index)")
    }
    
}
