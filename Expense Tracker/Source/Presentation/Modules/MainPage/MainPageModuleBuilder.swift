//
//  ModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

final class MainPageModuleBuilder {
    static func build() -> UIViewController {
        // MARK: - Override methods
        let presenter = MainPagePresenter()
        let viewController = MainPageViewController(presenter: presenter)
        viewController.view.backgroundColor = .white
        presenter.injectView(viewController)
        return viewController
    }
}
