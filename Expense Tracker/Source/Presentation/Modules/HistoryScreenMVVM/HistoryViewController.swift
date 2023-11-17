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
        self.historyView = HistoryView(historyViewModel: historyViewModel)
        super.init(nibName: nil, bundle: nil)
        
        bindViewModel()
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
        view.backgroundColor = .systemBackground
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyViewModel.loadData()
    }
    
    // MARK: - Private Methods
    
    private func bindViewModel() {
        historyViewModel.stateDidChanged = { [weak self] state in
            guard let self else { return }
            switch state {
            case .loaded(let items):
                DispatchQueue.main.async { [weak self] in
                    self?.historyView.updateTableView(with: items)
                }
            case .error:
                print("Error loading data")
            }
        }
    }
}
