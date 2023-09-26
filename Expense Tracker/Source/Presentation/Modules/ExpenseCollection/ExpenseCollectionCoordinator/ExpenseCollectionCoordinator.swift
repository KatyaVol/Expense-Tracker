//
//  ExpenseCollectionCoordinator.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 25.09.2023.
//

import UIKit

protocol ExpenseCollectionCoordinatorProtocol: CoordinatorProtocol {
    func pushCategory(coordinator: CoordinatorProtocol)
    func showCalendarPopover(coordinator: CoordinatorProtocol, cell: DateTableViewCell)
}

final class ExpenseCollectionCoordinator: NSObject,ExpenseCollectionCoordinatorProtocol{
    
    // MARK: - Private properties
    
    private(set) var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal methods
    
    func pushCategory(coordinator: CoordinatorProtocol) {
        let categoryViewController = CategoryModuleBuilder.build(coordinator: self)
        pushController(categoryViewController, animated: true)
    }
    
    func showCalendarPopover(coordinator: CoordinatorProtocol, cell: DateTableViewCell) {
        let calendarViewController = CalendarModuleBuilder.build(coordinator: self, popoverDelegate: self, cell: cell)
        presentController(calendarViewController, animated: true, completion: nil)
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension ExpenseCollectionCoordinator: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}
