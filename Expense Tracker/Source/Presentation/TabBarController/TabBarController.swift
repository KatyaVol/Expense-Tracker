//
//  TabBarController.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 06.05.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    let addExpenseViewController = AddExpenseModuleBuilder.build()
    let reportViewController = ReportViewController()
    let settingsViewController = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarItems()
        
        
    }
    
    //MARK: - Private func
    
    private func setupTabBarItems() {
        reportViewController.tabBarItem     = UITabBarItem(title: "Отчет",
                                                           image: UIImage(systemName: "chart.bar.xaxis"), selectedImage: UIImage(systemName: "chart.bar.xaxis"))
        
        addExpenseViewController.tabBarItem = UITabBarItem(title: "Добавить",
                                                           image: UIImage(systemName: "plus"),
                                                           selectedImage: UIImage(systemName: "plus"))
        
        settingsViewController.tabBarItem   = UITabBarItem(title: "Настройки",
                                                           image: UIImage(systemName: "gear"),
                                                           selectedImage: UIImage(systemName: "gear"))
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
