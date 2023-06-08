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
    func didTapSegmentControl(at index: Int, collectionView: UICollectionView) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func didTapSaveButton() {
        print("Button tapped!")
    }
}

