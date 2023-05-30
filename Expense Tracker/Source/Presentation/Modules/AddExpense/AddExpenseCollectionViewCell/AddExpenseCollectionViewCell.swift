//
//  ExpenseCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 18.05.2023.
//

import UIKit

final class AddExpenseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
   
    private let expenseDetails = makeExpenseDetails()
    
    // MARK: - UI Elements

    private lazy var tableView: SelfSizingTableView = {
        let tableView = SelfSizingTableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        return tableView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func customizeCell() {
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
    }
}

// MARK: - UITableViewDataSource

extension AddExpenseCollectionViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let expenseDetail = expenseDetails[indexPath.row]
        
        if expenseDetail.type == .category {
                    let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
                    cell.selectionStyle = .none
            cell.setCategoryImage(expenseDetail.image ?? UIImage(named: "icon_operations")!, text: expenseDetail.title)
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
                    cell.selectionStyle = .none
                    cell.setDetailText(expenseDetail.text ?? "Добавить", for: expenseDetail.title)
                    return cell
                }
            }
        }

