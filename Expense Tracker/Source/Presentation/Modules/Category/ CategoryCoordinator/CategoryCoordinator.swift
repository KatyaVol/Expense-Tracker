//
//  CategoryCoordinator.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 01.07.2023.
//

import UIKit

protocol CategoryCoordinatorProtocol: CoordinatorProtocol {
    func didSelectCategory()
}

final class CategoryCoordinator: CategoryCoordinatorProtocol {
    
    // MARK: - Private properties
    
    private(set) var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal methods
    
    func didSelectCategory() {
        popController(animated: true)
    }
}
