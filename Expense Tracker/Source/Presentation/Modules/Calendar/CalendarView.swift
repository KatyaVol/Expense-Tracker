//
//  CalendarView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 09.07.2023.
//

import UIKit
import FSCalendar

protocol CalendarViewDelegate: AnyObject {
    func didTapChooseButton(date: Date)
}

final class CalendarView: UIView {
    
    // MARK: - Private properties
    
    private var selectedDate: Date?
    private weak var delegate: CalendarViewDelegate?
    
    // MARK: - UI Elements
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .systemBackground
        backgroundView.layer.cornerRadius = 12
        return backgroundView
    }()
    
    private lazy var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.backgroundColor = .systemBackground
        calendar.scrollDirection = .vertical
        calendar.appearance.selectionColor = Colors.turquoiseColor
        calendar.appearance.weekdayTextColor = Colors.turquoiseColor
        calendar.appearance.headerTitleColor = Colors.turquoiseColor
        
        calendar.delegate = self
        return calendar
    }()
    
    private lazy var chooseButton: CustomButton = {
        let button = CustomButton(title: LocalizedStrings.chooseButton)
        button.buttonTappedCallback = { [weak self] in
            guard let date = self?.selectedDate else { return }
            self?.delegate?.didTapChooseButton(date: date)
        }
        return button
    }()
    
    // MARK: - Init
    
    init(delegate: CalendarViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        addSubviews([backgroundView, calendar, chooseButton])
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func updateCalendarAppearance() {
        calendar.appearance.titleDefaultColor = traitCollection.userInterfaceStyle == .dark ? .white : .black
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 300),
            
            calendar.topAnchor.constraint(equalTo: backgroundView.layoutMarginsGuide.topAnchor),
            calendar.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            calendar.heightAnchor.constraint(equalToConstant: 200),
            
            chooseButton.topAnchor.constraint(equalTo: calendar.bottomAnchor),
            chooseButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            chooseButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            chooseButton.heightAnchor.constraint(equalToConstant: 50),
            calendar.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - Trait Collection Changes
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateCalendarAppearance()
    }
}

// MARK: FSCalendarDelegate

extension CalendarView: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate = date
    }
}
