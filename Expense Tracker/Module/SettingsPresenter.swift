//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

protocol SettingsPresenterProtocol: AnyObject{
    func injectView(_ view: ViewControllerProtocol)
    
}

final class SettingsPresenter: SettingsPresenterProtocol {
    
    // MARK: - Private properties
    private weak var view: ViewControllerProtocol?
    
    func injectView(_ view: ViewControllerProtocol) {
          self.view = view
    }
}
