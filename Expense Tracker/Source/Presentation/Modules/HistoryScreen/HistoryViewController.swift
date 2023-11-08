//
//  HistoryViewController.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 26.10.2023.
//

import UIKit

final class HistoryViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let historyViewModel: HistoryViewModel
    private let historyView: HistoryView
    
    // MARK: - Init
    
    init(historyViewModel: HistoryViewModel) {
        self.historyViewModel = historyViewModel
        self.historyView = HistoryView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = historyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
    }
}


