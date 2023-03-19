//
//  SignIn module
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

protocol SignInPresentationLogic {

    // Показ полей
    func presentFields(response: SignIn.GetFields.Response)
}

final class SignInPresenter: SignInPresentationLogic {

    weak var viewController: SignInDisplayLogic?

    // MARK: Показ полей
    func presentFields(response: SignIn.GetFields.Response) {
        let viewModel = getViewModel()
        viewController?.displayFields(viewModel: SignIn.GetFields.ViewModel(result: viewModel))
    }
}

extension SignInPresenter {

    private func getViewModel() -> SignInViewModel {
        SignInViewModel()
    }
}
