//
//  CalendarViewController.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.07.2023.
//

import UIKit
import FSCalendar

protocol CalendarViewControllerProtocol: AnyObject {
    func didSelectDate(date: Date)
}

final class CalendarViewController: UIViewController, CalendarViewControllerProtocol {
    
    // MARK: - Private properties
  
    private let presenter: CalendarPresenterProtocol
    private lazy var calendarView = CalendarView(delegate: self)
    private let coordinator: AddExpenseCoordinatorProtocol?
    
    // MARK: - Init
    
    init(presenter: CalendarPresenterProtocol, coordinator: AddExpenseCoordinatorProtocol?) {
        self.presenter = presenter
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        view = calendarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
    }
}

// MARK: - CalendarViewDelegate
    
extension CalendarViewController: CalendarViewDelegate {
    func didSelectDate(date: Date) {}
    func didTapChooseButton() {
        coordinator?.dismissController(animated: true)
    }
}


