//
//  SignIn module
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

final class SignInBuilder {

    func build() -> SignInViewController {
        let presenter = SignInPresenter()
        let interactor = SignInInteractor(presenter: presenter)
        let controller = SignInViewController(interactor: interactor)
        presenter.viewController = controller
        return controller
    }
}