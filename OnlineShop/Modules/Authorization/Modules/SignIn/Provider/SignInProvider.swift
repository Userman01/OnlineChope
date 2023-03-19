//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

protocol SignInProviderProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<SignInModel>) -> Void)
}

final class SignInProvider: SignInProviderProtocol {

    private let service: SignInServiceProtocol

    init(service: SignInServiceProtocol = SignInService()) {
        self.service = service
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<SignInModel>) -> Void) {
        service.fetchFields(params: params, completion: completion)
    }
}