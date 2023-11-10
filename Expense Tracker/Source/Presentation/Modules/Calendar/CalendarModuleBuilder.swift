//
//  CalendarModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.07.2023.
//

import UIKit
import FSCalendar

final class CalendarModuleBuilder {
    static func build(coordinator: ExpenseCollectionCoordinatorProtocol, popoverDelegate: UIPopoverPresentationControllerDelegate, cell: DateTableViewCell) -> UIViewController {
        
        // MARK: - Assembly
        
        let presenter = CalendarPresenter( coordinator: coordinator)
        let viewController = CalendarViewController(presenter: presenter)
        presenter.view = viewController
        
        viewController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        viewController.preferredContentSize = CGSize(width: ScreenSize.width, height: 270)
        
        let popoverPresentationController = viewController.popoverPresentationController
        popoverPresentationController?.delegate = popoverDelegate
        popoverPresentationController?.sourceView = cell
        popoverPresentationController?.sourceRect = CGRect(x: cell.bounds.midX,
                                                           y: cell.bounds.maxY,
                                                           width: 200,
                                                           height: 0)
        popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.left
        
        return viewController
    }
}

