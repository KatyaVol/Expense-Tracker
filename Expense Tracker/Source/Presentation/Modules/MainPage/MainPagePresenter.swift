//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//
import UIKit

protocol MainPagePresenterProtocol: AnyObject {}

final class MainPagePresenter: MainPagePresenterProtocol {
    // MARK: - Private properties
    private weak var view: MainPageViewControllerProtocol?
    func injectView(_ view: MainPageViewControllerProtocol) {
          self.view = view
    }
}
