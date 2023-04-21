//
//  View.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

protocol SettingsViewControllerProtocol: AnyObject {}

final class SettingsViewController: UIViewController, SettingsViewControllerProtocol {
    // MARK: - Public properties
    var presenter: SettingsPresenterProtocol?

    // MARK: - Init
    init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
