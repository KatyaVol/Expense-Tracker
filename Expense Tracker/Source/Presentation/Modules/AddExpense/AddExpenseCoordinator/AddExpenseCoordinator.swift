//
//  AddExpenseCoordinator.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 10.05.2023.
//

import UIKit

protocol AddExpenseCoordinatorProtocol: CoordinatorProtocol {
    func pushCategory(coordinator: AddExpenseCoordinatorProtocol)
    func showCalendarPopover(coordinator: AddExpenseCoordinatorProtocol, cell: DateTableViewCell)
    func didSelectCategory()
}

final class AddExpenseCoordinator: NSObject, AddExpenseCoordinatorProtocol, UIPopoverPresentationControllerDelegate {
    
    
    // MARK: - Private properties
    
    private(set) var navigationController: UINavigationController
    private var dateTableViewCell: DateTableViewCell?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal methods
    
    func pushCategory(coordinator: AddExpenseCoordinatorProtocol) {
        let categoryViewController = CategoryModuleBuilder.build(coordinator: self)
        pushController(categoryViewController, animated: true)
    }
    
    func showCalendarPopover(coordinator: AddExpenseCoordinatorProtocol, cell: DateTableViewCell) {
        let dateTableViewCell = cell
        let calendarViewController = CalendarModuleBuilder.build(coordinator: self)
        calendarViewController.modalPresentationStyle = .popover
        
        let screenWidth = UIScreen.main.bounds.width
        calendarViewController.preferredContentSize = CGSize(width: screenWidth, height: 270)
        
        let popoverPresentationController = calendarViewController.popoverPresentationController
        popoverPresentationController?.delegate = self
        popoverPresentationController?.sourceView = dateTableViewCell
        popoverPresentationController?.sourceRect = CGRect(x: dateTableViewCell.bounds.midX,
                                                           y: dateTableViewCell.bounds.maxY,
                                                           width: 200,
                                                           height: 0)
        popoverPresentationController?.permittedArrowDirections = .left
        presentController(calendarViewController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
    
    func didSelectCategory() {
        popController(animated: true)
    }
}
