//
//  CalendarViewController.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.07.2023.
//

import UIKit
import FSCalendar

protocol CalendarViewControllerProtocol: AnyObject {}

final class CalendarViewController: UIViewController, CalendarViewControllerProtocol {
    
    // MARK: - Private properties
  
    private let presenter: CalendarPresenterProtocol
    private lazy var calendarView = CalendarView(delegate: self)
    
    // MARK: - Init
    
    init(presenter: CalendarPresenterProtocol) {
        self.presenter = presenter
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
    
    func didTapChooseButton(date: Date) {
        presenter.didTapChooseButton(date: date)
    }
}


