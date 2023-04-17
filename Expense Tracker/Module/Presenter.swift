//
//  Presenter.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 17.04.2023.
//

import UIKit

protocol MyPresenterProtocol: AnyObject{
    
}

final class MyPresenterImpl: MyPresenterProtocol {
    
    // MARK: - Public properties
    weak var view: ViewController?
}
