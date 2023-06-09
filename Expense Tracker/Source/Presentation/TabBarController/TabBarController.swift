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
    private let historyViewController = HistoryViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItems()
        setupTabBarAppearance()
    }
    
    //MARK: - Private func
    
    private func setupTabBarItems() {
        reportViewController.tabBarItem = UITabBarItem(title: NSLocalizedString ("report", comment: ""),
                                                       image: UIImage(named: "icon_report"),
                                                       tag: 0)
        
        addExpenseViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("add", comment: ""),
                                                           image: UIImage(named: "icon_ add"),
                                                           tag: 1)
        
        historyViewController.tabBarItem = UITabBarItem(title: NSLocalizedString ("history", comment: ""),
                                                        image: UIImage(named: "icon_history"),
                                                        tag: 2)
        
        settingsViewController.tabBarItem = UITabBarItem(title: NSLocalizedString ("settings", comment: ""),
                                                         image: UIImage(named: "icon_settings"),
                                                         tag: 3)
        viewControllers = [reportViewController,
                           addExpenseViewController, historyViewController,
                           settingsViewController]
    }
    
    private func setupTabBarAppearance() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.turquoiseColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.turquoiseColor], for: .selected)
        
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.normal.iconColor = Colors.turquoiseColor
            appearance.stackedLayoutAppearance.selected.iconColor = Colors.turquoiseColor
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: Colors.turquoiseColor]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: Colors.turquoiseColor]
            self.tabBar.standardAppearance = appearance
        } else {
            self.tabBar.tintColor = Colors.turquoiseColor
        }
    }
}

final class ReportViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
    }
}

final class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
    }
}

final class HistoryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
    }
}
