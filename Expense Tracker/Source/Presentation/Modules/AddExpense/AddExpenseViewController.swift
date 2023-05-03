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

    // MARK: - Public properties

    private var presenter: AddExpensePresenterProtocol?

    // MARK: - Private properties

    private lazy var myButton: UIButton = {
        let myButton = UIButton()
        myButton.setTitle(Strings.signUpButtonTitle, for: .normal)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.backgroundColor = .systemBlue
        myButton.setTitleColor(.white, for: .normal)
        myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return myButton
    }()

    // MARK: - Init

    init(presenter: AddExpensePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myButton)
        setupAutoLayout()
    }
    
    // MARK: - Private func
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.widthAnchor.constraint(equalToConstant: 200),
            myButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func buttonTapped() {
        print("Button tapped!")
    }
}
