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
    private lazy var addExpenseView = AddExpenseView(delegate: self)
    
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
        super.loadView()
        view = addExpenseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground
    }
}

// MARK: - AddExpenseViewDelegate

extension AddExpenseViewController: AddExpenseViewDelegate {
    func didTapSaveButton() {
        print("Button tapped!")
    }
}

// MARK: - AddExpenseCollectionViewCellDelegate

extension AddExpenseViewController: AddExpenseCollectionViewCellDelegate {
    func didTapDateLabel(in cell: AddExpenseCollectionViewCell) {
        print("Date Label tapped in view controller!")
    }
    
    func didTapCategoryImage(in cell: AddExpenseCollectionViewCell) {
        print("Category Image View tapped in view controller!")
    }
}

