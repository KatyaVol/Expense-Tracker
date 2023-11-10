//
//  ExpenseCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 18.05.2023.
//

import UIKit

protocol AddExpenseCollectionViewCellDelegate: AnyObject {
    func didTapCategoryStackView()
    func didTapDateLabel(cell: DateTableViewCell)
    func didPassTextFieldData(text: String?, type: ExpenseDetailType)
}

final class AddExpenseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Internal properties
    
    weak var delegate: AddExpenseCollectionViewCellDelegate?
    
    // MARK: - Private properties
    
    private var expenseDetails: [ExpenseDetail] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - UI Elements
    
    private lazy var tableView: SelfSizingTableView = {
        let tableView = SelfSizingTableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(cell: CategoryTableViewCell.self)
        tableView.register(cell: DateTableViewCell.self)
        tableView.register(cell: DetailTableViewCell.self)
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorInset = UIEdgeInsets(top: 0,
                                                left: 17,
                                                bottom: 0,
                                                right: 17)
        return tableView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Public Methods
    
    public func setExpenseDetails(_ details: [ExpenseDetail]) {
        expenseDetails = details
    }
    
    // MARK: - Private Methods
    
    private func customizeTableView() {
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
        
        switch expenseDetail.type {
        case .category:
            let cell: CategoryTableViewCell = tableView.dequeueCell(for: indexPath)
            cell.delegate = self
            cell.selectionStyle = .none
            cell.setCategoryImage(expenseDetail: expenseDetail)
            return cell
            
        case .amount, .note:
            let cell: DetailTableViewCell = tableView.dequeueCell(for: indexPath)
            cell.delegate = self
            cell.selectionStyle = .none
            cell.setDetailText(expenseDetail: expenseDetail)
            return cell
            
        case .date:
            let cell: DateTableViewCell = tableView.dequeueCell(for: indexPath)
            cell.delegate = self
            cell.selectionStyle = .none
            cell.setDateText(expenseDetail: expenseDetail)
            return cell
        }
    }
}

// MARK: - CategoryTableViewCellDelegate

extension AddExpenseCollectionViewCell: CategoryTableViewCellDelegate {
    func didTapCategoryStackView() {
        delegate?.didTapCategoryStackView()
    }
}

// MARK: - DateTableViewCellDelegate

extension AddExpenseCollectionViewCell: DateTableViewCellDelegate {
    func didTapDateLabel(cell: DateTableViewCell) {
        delegate?.didTapDateLabel(cell: cell)
    }
}

// MARK: - DateTableViewCellDelegate

extension AddExpenseCollectionViewCell: DetailTableViewCellDelegate {
    func didPassTextFieldData(text: String?, type: ExpenseDetailType) {
        delegate?.didPassTextFieldData(text: text, type: type)
    }
}
