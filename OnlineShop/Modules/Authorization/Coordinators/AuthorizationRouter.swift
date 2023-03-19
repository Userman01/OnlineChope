//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

protocol AuthorizationRouterProtocol {
    func openSignIn()
}

final class AuthorizationRouter: AuthorizationRouterProtocol {
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func openSignIn() {
        let controller = SignInBuilder().build()
        router.push(controller)
    }
}
