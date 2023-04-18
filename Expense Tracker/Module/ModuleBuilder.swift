//
//  ModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

final class ModuleBuilder {
    func build() -> UIViewController {
        
        // MARK: - Override methods
        let presenter = SettingsPresenterImpl()
        let viewController = ViewController(presenter: presenter)
        
        
        viewController.view.backgroundColor = .white
        
        viewController.presenter = presenter
        presenter.view = viewController
        return viewController
    }
}
