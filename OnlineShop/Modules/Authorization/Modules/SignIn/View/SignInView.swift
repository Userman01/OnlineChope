//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

final class SignInView: UIView {

    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = ViewMetrics.backgroundColor
        return tableView
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
        addSubview(tableView)
        tableView.frame = frame
    }

    func updateTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.reloadData()
    }
}
