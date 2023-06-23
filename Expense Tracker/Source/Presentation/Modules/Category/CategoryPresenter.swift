//
//  CategoryPresenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 21.06.2023.
//
import UIKit

protocol CategoryPresenterProtocol: AnyObject {}

final class CategoryPresenter: CategoryPresenterProtocol {
    
    // MARK: - Properties
    
    weak var view: CategoryViewControllerProtocol?
    
}
