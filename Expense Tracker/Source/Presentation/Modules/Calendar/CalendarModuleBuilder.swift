//
//  CalendarModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.07.2023.
//

import UIKit
import FSCalendar

final class CalendarModuleBuilder {
    static func build(coordinator: CoordinatorProtocol, cell: DateTableViewCell) -> UIViewController {
        
        // MARK: - Assembly
        
        let presenter = CalendarPresenter()
        let viewController = CalendarViewController(presenter: presenter)
        presenter.view = viewController
        
        let dateTableViewCell = cell
        let calendarViewController =   viewController
        calendarViewController.modalPresentationStyle = .popover
        
        let screenWidth = UIScreen.main.bounds.width
        calendarViewController.preferredContentSize = CGSize(width: screenWidth, height: 270)
        
        let popoverPresentationController = calendarViewController.popoverPresentationController
        popoverPresentationController?.delegate = coordinator as? UIPopoverPresentationControllerDelegate
        popoverPresentationController?.sourceView = dateTableViewCell
        popoverPresentationController?.sourceRect = CGRect(x: dateTableViewCell.bounds.midX,
                                                           y: dateTableViewCell.bounds.maxY,
                                                           width: 200,
                                                           height: 0)
        popoverPresentationController?.permittedArrowDirections = .left
        
        return viewController
    }
}

