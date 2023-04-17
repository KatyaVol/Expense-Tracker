//
//  ModuleBuilder.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

final class ModuleBuilder {
    static func build() -> ViewController {
        
        // MARK: - Override methods
        let presenter = MyPresenterImpl()
        let view = ViewController(presenter: presenter)
        
        presenter.view = view
        return view
    }
}
