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
        representableViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
