//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//
import KeychainSwift

typealias AuthorizationCoordinatorOut = (AuthorizationCoordinatorOutCmd) -> Void
enum AuthorizationCoordinatorOutCmd {
    case openPrimary
}

final class AuthorizationCoordinator: BaseCoordinator {
    
    private let authorizationRouter: AuthorizationRouterProtocol
    private let out: AuthorizationCoordinatorOut
    
    init(router: RouterProtocol, out: @escaping AuthorizationCoordinatorOut) {
        self.authorizationRouter = AuthorizationRouter(router: router)
        self.out = out
    }
    
    override func start() {
        if UserAuthService.shared.isUserAuthorized() {
        } else {
            openSignIn()
        }
    }
    
    private func openSignIn() {
        authorizationRouter.openSignIn()
    }
}
