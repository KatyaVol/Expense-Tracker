//
//  HistoryTableViewCell.swift
//  Expense Tracker
//
//  Created by Ekaterina Volobueva on 02.11.2023.
//

import UIKit
import SnapKit

final class HistoryTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    private let historyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBackground
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.font = UIFont.tableViewFont
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.smallTextFont
        label.textColor = Colors.turquoiseColor
        label.backgroundColor = .systemBackground
        return label
    }()
    
    private let expenseLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemBackground
        label.font = UIFont.tableViewFont
        return label
    }()
    
    private let pencilImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_edit")
        return imageView
    }()
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(with item: UserInput) {
        if let categoryImage = item.categoryImage,
           let image = UIImage(data: categoryImage) {
            historyImageView.image = image.withRenderingMode(.alwaysTemplate)
            historyImageView.tintColor = Colors.whiteAndBlack
        } else {
            historyImageView.image = UIImage(named: "icon_operations")?.withRenderingMode(.alwaysTemplate)
            historyImageView.tintColor = Colors.whiteAndBlack
        }
        
        if let date = item.date  {
            dateLabel.text = DateFormatter.dateString(from: date)
        } else {
            dateLabel.text = ""
        }
    
        nameLabel.text = item.categoryText
        
        if let amount = item.amount {
            expenseLabel.text = amount + LocalizedStrings.ruble
        } else {
            expenseLabel.text = ""
        }
    }
    
    // MARK: - Private Methods
    
    private func layout() {
        contentView.addSubview(container)
        container.addSubviews([historyImageView, dateLabel, nameLabel, expenseLabel, pencilImage])
        
        container.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(CGFloat.spacing8)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        historyImageView.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(CGFloat.spacing6)
            make.leading.equalTo(container)
            make.height.width.equalTo(CGFloat.spacing24)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(CGFloat.spacing6)
            make.leading.equalTo(historyImageView.snp.trailing).offset(CGFloat.spacing12)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(container.snp.bottom)
            make.leading.equalTo(historyImageView.snp.trailing).offset(CGFloat.spacing12)
            make.top.equalTo(dateLabel.snp.bottom)
        }
        
        expenseLabel.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(CGFloat.spacing8)
            make.leading.equalTo(dateLabel.snp.trailing).offset(CGFloat.spacing8)
            make.trailing.equalTo(pencilImage.snp.leading)
            make.bottom.equalTo(container.snp.bottom)
        }
        
        pencilImage.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(CGFloat.spacing12)
            make.bottom.equalTo(container.snp.bottom).inset(CGFloat.spacing6)
            make.trailing.equalTo(container.snp.trailing)
        }
    }
}
