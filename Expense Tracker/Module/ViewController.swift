//
//  View.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit


protocol ViewControllerProtocol: AnyObject {
    
}

final class ViewController: UIViewController, ViewControllerProtocol {
    
    // MARK: - Public properties
    var presenter: ISettingsPresenter?
    
    
    // MARK: - Init
    init(presenter: ISettingsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter?.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
