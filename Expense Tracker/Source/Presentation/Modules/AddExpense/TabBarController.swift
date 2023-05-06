//
//  TabBarController.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 06.05.2023.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
    }
}

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addExpenseViewController = AddExpenseModuleBuilder.build()
        
        viewControllers = [addExpenseViewController]
    }
}
