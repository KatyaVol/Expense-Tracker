//
//  View.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

protocol AddExpenseViewControllerProtocol: AnyObject {
    func printFetchedDataFromCoreData(_ data: [UserInput])
    func showValidationError(error: ExpenseValidationError)
}

final class AddExpenseViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let presenter: AddExpensePresenterProtocol
    private lazy var addExpenseView = AddExpenseView(delegate: self,
                                                     navigationController: navigationController)
    
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
        
        addExpenseView?.addChildViewController(to: self)
        view.backgroundColor = UIColor.systemBackground
        presenter.printFetchedDataFromCoreData()
    }
}

// MARK: - AddExpenseViewDelegate

extension AddExpenseViewController: AddExpenseViewDelegate {
    func didTapSaveButton() {
        print("SaveButton tapped in AddExpenseViewController")
        presenter.saveButtonTapped()
        presenter.validateAndProcessExpense()
    }
}

// MARK: - AddExpenseViewControllerProtocol

extension AddExpenseViewController: AddExpenseViewControllerProtocol {
    
    func printFetchedDataFromCoreData(_ data: [UserInput]) {
        data.forEach { printFetchedData(from: $0) }
    }
    func showValidationError(error: ExpenseValidationError) {
        let alert = UIAlertController(title: "\(LocalizedStrings.alert)",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func printFetchedData(from data: UserInput) {
        print("Fetched Category Text: \(String(describing: data.categoryText))")
        print("Fetched Category Image: \(String(describing: data.categoryImage.flatMap { UIImage(data: $0) }))")
        print("Fetched Date: \(String(describing: data.date.map { DateFormatter.dateString(from: $0) }))")
        print("Fetched Amount: \(String(describing: data.amount))")
        print("Fetched Note: \(String(describing: data.note))")
    }
}


