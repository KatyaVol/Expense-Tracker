//
//  HistoryCoordinator.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 26.10.2023.
//

import UIKit

protocol HistoryCoordinatorProtocol: CoordinatorProtocol { }

final class HistoryCoordinator: HistoryCoordinatorProtocol {
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
