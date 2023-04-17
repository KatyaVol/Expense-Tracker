//
//  ModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

class ModuleBuilder {
    static func build() -> MyView {
        let presenter = MyPresenter()
        let view = MyView(presenter: presenter)
        presenter.view = view
        return view
    }
}
