//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

protocol ISettingsPresenter: AnyObject{
    var view: ViewControllerProtocol? { get set }
    
}

final class SettingsPresenterImpl: ISettingsPresenter {
    
    // MARK: - Public properties
    internal weak var view: ViewControllerProtocol?
}
