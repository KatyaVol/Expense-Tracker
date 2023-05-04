//
//  View.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

protocol AddExpenseViewControllerProtocol: AnyObject {}

final class AddExpenseViewController: UIViewController,
                                      AddExpenseViewControllerProtocol {
    
    // MARK: - Private properties
    
    private let presenter: AddExpensePresenterProtocol
    private let addExpenseView = AddExpenseView()
    
    // MARK: - Init
    
    init(presenter: AddExpensePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addExpenseView)
        addExpenseView.frame = view.bounds
        addExpenseView.myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - Private func
    
    @objc private func buttonTapped() {
        print("Button tapped!")
    }
}
