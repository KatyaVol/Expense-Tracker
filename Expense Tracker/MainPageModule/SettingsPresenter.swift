//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//
import UIKit

protocol SettingsPresenterProtocol: AnyObject {}

final class SettingsPresenter: SettingsPresenterProtocol {
    // MARK: - Private properties
    private weak var view: SettingsViewControllerProtocol?
    func injectView(_ view: SettingsViewControllerProtocol) {
          self.view = view
    }
}
