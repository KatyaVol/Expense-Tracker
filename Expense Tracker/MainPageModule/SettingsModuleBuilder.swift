//
//  ModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

final class SettingsModuleBuilder {
    static func build() -> UIViewController {
        // MARK: - Override methods
        let presenter = SettingsPresenter()
        let viewController = SettingsViewController(presenter: presenter)
        viewController.view.backgroundColor = .white
        presenter.injectView(viewController)
        return viewController
    }
}
