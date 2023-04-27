//
//  TextFieldViewCell.swift
//  OnlineShop
//
//  Created by Петр Постников on 19.03.2023.
//

import UIKit

class TextFieldCell: UITableViewCell {
    enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
    }

    var didEditText: ((String) -> Void)?
    var didFillText: ((String) -> Void)?
    var didCleanText: (() -> Void)?

    var textFieldView: TextFieldView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTextFieldView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextFieldView() {
        textFieldView = TextFieldView()
        textFieldView.didEditText = { [weak self] text in
            self?.didEditText?(text)
        }
        textFieldView.didFillText = { [weak self] text in
            self?.didFillText?(text)
        }
        textFieldView.didCleanText = { [weak self] in
            self?.didCleanText?()
        }
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
        selectionStyle = .none
        contentView.addSubview(textFieldView)
        
        textFieldView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setBackgroundColor(with color: UIColor) {
        backgroundColor = color
    }

    func configure(with viewModel: TextFieldViewModel, textFieldInsets: UIEdgeInsets) {
        textFieldView.layoutMargins = textFieldInsets
    }
}

