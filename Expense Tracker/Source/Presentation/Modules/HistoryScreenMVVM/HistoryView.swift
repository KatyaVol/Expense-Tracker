//
//  HistoryView.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 03.11.2023.
//

import UIKit
import SnapKit

final class HistoryView: UIView {
    
    // MARK: - Private properties

    private(set) var historyViewModel: IHistoryViewModel
    
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizedStrings.history
        label.font = .headerFont
        return label
    }()
    
    private(set) lazy var historyTableView: SelfSizingTableView = {
        let tableView = SelfSizingTableView()
        tableView.register(cell: HistoryTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        return indicator
    }()
    
    // MARK: - Init
    
    init(historyViewModel: HistoryViewModel) {
        self.historyViewModel = historyViewModel
        super.init(frame: .zero)
        layout()
        bindViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func bindViewModel() {
        historyViewModel.stateDidChanged = { [weak self] state in
            guard let self else { return }
            switch state {
            case .loading:
                self.historyTableView.reloadData()
                self.activityIndicator.startAnimating()
            case .loaded:
                self.activityIndicator.stopAnimating()
                self.historyTableView.reloadData()
            case .error(let errors):
                self.activityIndicator.stopAnimating()
                self.handleError(errors: errors)
            }
        }
    }
    
    private func handleError(errors: [HistoryViewModelError]) {
        for error in errors {
            switch error {
            case .dataLoadFailure:
                debugPrint("Error loading data")
            case .unknownError:
                debugPrint("Unknown error")
            }
        }
    }
    
    private func layout() {
        addSubviews([historyLabel, historyTableView, activityIndicator])
        
        historyLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(CGFloat.spacing36)
            make.leading.equalTo(self).offset(CGFloat.spacing16)
            make.trailing.equalTo(self).inset(CGFloat.spacing16)
            make.height.equalTo(CGFloat.spacing36)
        }
        
        historyTableView.snp.makeConstraints { make in
            make.top.equalTo(historyLabel.snp.bottom).offset(CGFloat.spacing36)
            make.leading.equalTo(self).offset(CGFloat.spacing16)
            make.trailing.equalTo(self).inset(CGFloat.spacing16)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource

extension HistoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyViewModel.numbersOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        let item = historyViewModel.item(at: indexPath.row)
        cell.configure(with: item)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HistoryView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row - \(indexPath.row)")
        historyViewModel.changeState(.itemSelected(atIndex: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("row - \(indexPath.row) deleted")
            historyViewModel.changeState(.itemDeleted(atIndex: indexPath.row))
        }
    }
}
