//
//  SignIn module
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

final class SignInTableDataSource: NSObject, UITableViewDataSource {

    weak var delegate: SignInViewControllerDelegate?

    var representableViewModel: SignInViewModel

    init(viewModel: SignInViewModel = SignInViewModel()) {
        representableViewModel = viewModel
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        representableViewModel.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = representableViewModel.cells[safe: indexPath.row] else { return UITableViewCell() }
        switch cellType {
        case let .title(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: TextCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .textField(viewModel, insets):
            let cell = tableView.dequeueReusableCellWithRegistration(type: TextFieldCell.self, indexPath: indexPath)
            cell.configure(with: viewModel, textFieldInsets: insets)
            return cell
        case let .button(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: ActionButtonCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        }
    }
}
