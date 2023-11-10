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
    
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizedStrings.history
        label.font = .headerFont
        return label
    }()
    
    private lazy var historyTableView: SelfSizingTableView = {
        let tableView = SelfSizingTableView()
        tableView.register(cell: HistoryTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func layout() {
        addSubviews([historyLabel, historyTableView])
        
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
    }
}

// MARK: - UITableViewDataSource

extension HistoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HistoryView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row - \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("row - \(indexPath.row) deleted")
        }
    }
}
