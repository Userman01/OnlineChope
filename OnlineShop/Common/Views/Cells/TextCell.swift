//
//  TextCell.swift
//  OnlineShop
//
//  Created by Петр Постников on 19.03.2023.
//

import UIKit

class TextCell: UITableViewCell {
    
    enum ViewMetrics {
        static let margins = NSDirectionalEdgeInsets(top: 10.0, leading: .spacing16Pt, bottom: 10.0, trailing: .spacing16Pt)
        static let minHeight: CGFloat = 60.0

        static let iconImageMargin: CGFloat = 26.0
        static let iconImageSize = CGSize(width: 24.0, height: 24.0)
        static let switchImageSize = CGSize(width: 38.0, height: 23.0)
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font16Medium
        label.numberOfLines = 2
        label.baselineAdjustment = .alignCenters
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with viewModel: TextViewModel) {
        titleLabel.text = viewModel.text
        titleLabel.tintColor = viewModel.titleColor
        titleLabel.textAlignment = viewModel.textAlignment
        contentView.snp.makeConstraints { make in
            make.directionalMargins.equalToSuperview().inset(viewModel.margins)
        }
    }
}
