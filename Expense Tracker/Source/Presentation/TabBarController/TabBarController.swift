//
//  TabBarController.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 06.05.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let addExpenseViewController = AddExpenseModuleBuilder.build()
    private let reportViewController = ReportViewController()
    private let settingsViewController = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItems()
    }
    
    //MARK: - Private func
    
    private func setupTabBarItems() {
        reportViewController.tabBarItem = UITabBarItem(title: NSLocalizedString ("report", comment: ""),
                                                       image: UIImage(named: "icon_report"),
                                                       tag: 0)
        
        addExpenseViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("add", comment: ""),
                                                           image: UIImage(named: "icon_ add"),
                                                           tag: 1)
        
        settingsViewController.tabBarItem = UITabBarItem(title: NSLocalizedString ("settings", comment: ""),
                                                         image: UIImage(named: "icon_settings"),
                                                         tag: 2)
        viewControllers = [reportViewController,
                           addExpenseViewController,
                           settingsViewController]
    }
}

final class ReportViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

final class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
