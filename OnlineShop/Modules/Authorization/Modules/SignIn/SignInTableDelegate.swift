//
//  SignIn module
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

final class SignInTableDelegate: NSObject, UITableViewDelegate {

    weak var delegate: SignInViewControllerDelegate?

    var representableViewModel: SignInViewModel

    init(viewModel: SignInViewModel = SignInViewModel()) {
        representableViewModel = viewModel
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
