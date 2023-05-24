//
//  ExpenseCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 18.05.2023.
//

import UIKit

final class AddExpenseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    let expenseModel = Expense.makeExpense()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
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
    
    //MARK: - Private func
    
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let expense = expenseModel[0]
        
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "d MMMM yyyy"
            formatter.locale = Locale(identifier: "ru_RU")
            return formatter
        }()
    
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
            cell.selectionStyle = .none
            cell.setCategoryImage(expense.categoryImage)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
            cell.selectionStyle = .none
            switch indexPath.row {
            case 1:
                let dateString: String
                if Calendar.current.isDateInToday(expense.date) {
                    dateString = "Сегодня"
                } else {
                    dateString = dateFormatter.string(from: expense.date)
                }
                cell.setDetailText(dateString, for: .date)
            case 2:
                let amountString: String
                if expense.isAmountSet{
                    amountString = String(format: "%.2f", expense.amount)
                } else {
                    amountString = "0"
                }
                cell.setDetailText(amountString, for: .amount)
            case 3:
                let noteString = expense.note ?? "Добавить"
                cell.setDetailText(noteString, for: .note)
            default:
                break
            }
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension AddExpenseCollectionViewCell: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 4
    }
}

