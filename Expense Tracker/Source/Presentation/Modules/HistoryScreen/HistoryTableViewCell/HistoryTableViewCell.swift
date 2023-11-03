//
//  HistoryCollectionViewCell.swift
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        label.font = UIFont.tableViewFont
        label.text = "сегодня"
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.smallTextFont
        label.text = "название категории"
        return label
    }()
    
    private let expenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGreen
        label.font = UIFont.tableViewFont
        label.text = "3000 р."
        return label
    }()
    
    private let pencilImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "ic_edit")
        return imageView
    }()
    
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
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
    
    // MARK: - Private Methods
    
    private func layout() {
        contentView.addSubview(container)
        contentView.addSubviews([historyImageView, dateLabel, nameLabel, expenseLabel, pencilImage])
        
        container.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(CGFloat.mediumOffset)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        
        historyImageView.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(CGFloat.smallMediumOffset)
            make.leading.equalTo(container)
            make.height.width.equalTo(CGFloat.imageHeight)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(CGFloat.smallMediumOffset)
            make.leading.equalTo(historyImageView.snp.trailing).offset(CGFloat.bigOffset)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(container.snp.bottom)
            make.leading.equalTo(historyImageView.snp.trailing).offset(CGFloat.bigOffset)
            make.top.equalTo(dateLabel.snp.bottom)
        }
        
        expenseLabel.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(CGFloat.smallMediumOffset)
            make.leading.equalTo(dateLabel.snp.trailing).offset(CGFloat.mediumOffset)
            make.trailing.equalTo(pencilImage.snp.leading)
            make.bottom.equalTo(container.snp.bottom)
        }
        
        pencilImage.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(CGFloat.largestOffset)
            make.bottom.equalTo(container.snp.bottom).offset(-CGFloat.smallestOffset)
            make.trailing.equalTo(container.snp.trailing)
        }
    }
}

// MARK: - extension CGFloat

private extension CGFloat {
    static let smallestOffset: CGFloat = 5
    static let smallMediumOffset: CGFloat = 6
    static let mediumOffset: CGFloat = 8
    static let bigOffset: CGFloat = 11
    static let largestOffset: CGFloat = 13
    static let imageHeight: CGFloat = 24
}
