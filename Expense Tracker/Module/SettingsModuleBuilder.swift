//
//  ModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

final class ModuleBuilder {
    static func build() -> UIViewController {
        
        // MARK: - Override methods
        let presenter = SettingsPresenter()
        let viewController = ViewController(presenter: presenter)
        
        viewController.view.backgroundColor = .white
        
        presenter.injectView(viewController)
        return viewController
    }
}
