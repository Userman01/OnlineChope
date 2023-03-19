//
//  SignIn module
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

protocol SignInBusinessLogic {

    // Получение полей
    func getFields(request: SignIn.GetFields.Request)
}

final class SignInInteractor: SignInBusinessLogic {

    private let provider: SignInProviderProtocol
    private let presenter: SignInPresentationLogic

    init(provider: SignInProviderProtocol = SignInProvider(),
         presenter: SignInPresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: SignIn.GetFields.Request) {
        presenter.presentFields(response: SignIn.GetFields.Response())
    }
}
