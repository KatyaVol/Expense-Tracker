//
//  CategoryCoordinator.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 01.07.2023.
//

import UIKit

protocol CategoryCoordinatorProtocol: AnyObject {
    func didSelectCategory()
}

final class CategoryCoordinator: CategoryCoordinatorProtocol {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func didSelectCategory() {
        navigationController?.popViewController(animated: true)
    }
}
