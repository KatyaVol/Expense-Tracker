//
//  CustomSegmentedControl.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 15.09.2023.
//

import UIKit

final class CustomSegmentedControl: UISegmentedControl {
    
    // MARK: - Properties
    
    var valueChangedCallBack: ((Int)-> Void)?
    
    // MARK: - Init
    
    init() {
        super.init(items: [LocalizedStrings.income, LocalizedStrings.expense])
        configureSegmentedControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureSegmentedControl() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleTextAttributes([NSAttributedString.Key.font: UIFont.segmentedControlFont], for: .normal)
        addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - Actions
    
    @objc private func valueChanged(_ sender: UISegmentedControl) {
        valueChangedCallBack?(sender.selectedSegmentIndex)
    }
}
