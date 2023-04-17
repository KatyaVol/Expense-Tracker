//
//  View.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Public properties
    var presenter: MyPresenterImpl?
    
    
    // MARK: - Init
    init(presenter: MyPresenterImpl) {
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
