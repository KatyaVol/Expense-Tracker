//
//  CalendarModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.07.2023.
//

import UIKit
import FSCalendar

final class CalendarModuleBuilder {
    static func build(coordinator: AddExpenseCoordinatorProtocol) -> UIViewController {
        
        // MARK: - Assembly
        
        let presenter = CalendarPresenter()
        let viewController = CalendarViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
}
