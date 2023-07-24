//
//  CalendarModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.07.2023.
//

import UIKit
import FSCalendar

final class CalendarModuleBuilder {
    static func build(coordinator: AddExpenseCoordinatorProtocol, popoverDelegate: UIPopoverPresentationControllerDelegate, cell: DateTableViewCell) -> UIViewController {
        
        // MARK: - Assembly
        
        let presenter = CalendarPresenter()
        let viewController = CalendarViewController(presenter: presenter)
        presenter.view = viewController
        
        viewController.modalPresentationStyle = .popover
        
        viewController.preferredContentSize = CGSize(width: ScreenSize.width, height: 270)
        
        let popoverPresentationController = viewController.popoverPresentationController
        popoverPresentationController?.delegate = popoverDelegate
        popoverPresentationController?.sourceView = cell
        popoverPresentationController?.sourceRect = CGRect(x: cell.bounds.midX,
                                                           y: cell.bounds.maxY,
                                                           width: 200,
                                                           height: 0)
        popoverPresentationController?.permittedArrowDirections = .left
        
        return viewController
    }
}

