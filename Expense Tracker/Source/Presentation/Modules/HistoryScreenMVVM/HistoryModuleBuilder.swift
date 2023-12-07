//
//  HistoryModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 26.10.2023.
//

import UIKit

final class HistoryModuleBuilder {
    static func build() -> UIViewController {
        
        let coreDataContainer = CoreDataContainer.shared
        let coreDataService = CoreDataStorage(container: coreDataContainer)
        let historyViewModel = HistoryViewModel(coreDataService: coreDataService)
        let viewController = HistoryViewController(historyViewModel: historyViewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        return navigationController
    }
}
