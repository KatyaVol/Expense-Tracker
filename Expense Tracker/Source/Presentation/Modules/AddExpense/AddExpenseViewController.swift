//
//  View.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

protocol AddExpenseViewControllerProtocol: AnyObject {}

final class AddExpenseViewController: UIViewController,
                                      AddExpenseViewControllerProtocol, AddExpenseViewDelegate {
    
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
    
    override func loadView() {
        view = addExpenseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addExpenseView.delegate = self
    }
    
    func buttonDidTap() {
            print("Button tapped!")
        }
}
