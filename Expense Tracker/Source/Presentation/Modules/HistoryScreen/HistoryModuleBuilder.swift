//
//  HistoryModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 26.10.2023.
//

import UIKit

final class HistoryModuleBuilder {
    static func build() -> UIViewController {
        
        let historyViewModel = HistoryViewModel()
        let viewController = HistoryViewController(historyViewModel: historyViewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        return navigationController
    }
}
