//
//  ExpenseCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 18.05.2023.
//

import UIKit

final class AddExpenseCollectionViewCell: UICollectionViewCell {
    
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
    }
}



