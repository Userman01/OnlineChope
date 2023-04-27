//
//  ActionButtonCell.swift
//  OnlineShop
//
//  Created by Петр Постников on 19.03.2023.
//

import UIKit

class ActionButtonCell: UITableViewCell {
    
    enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
        static let separatorInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: .greatestFiniteMagnitude)
    }

    var didTapButton: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    func setupLayout() {
        separatorInset = ViewMetrics.separatorInset
        selectionStyle = .none
        backgroundColor = ViewMetrics.backgroundColor
        contentView.addSubview(actionButton)
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            actionButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            actionButton.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }

    func configure(with viewModel: ActionButtonCellViewModel) {
        actionButton.setButtonStyle(viewModel.style)
        actionButton.setTitle(viewModel.title, for: .normal)
        actionButton.isEnabled = viewModel.isEnabled
        contentView.setDirectionalLayoutMargins(viewModel.margins)
        backgroundColor = viewModel.backgroundColor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var actionButton: ActionButton = {
        let button = ActionButton(style: .primary)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func buttonTapped() {
        didTapButton?()
    }
}
