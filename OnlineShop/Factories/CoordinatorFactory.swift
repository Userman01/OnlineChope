//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    
    func makeApplicationCoordinator(router: RouterProtocol) -> ApplicationCoordinator
    
    func makeAuthorizationCoordinator(router: RouterProtocol, out: @escaping AuthorizationCoordinatorOut) -> AuthorizationCoordinator
    
    func makePrimaryCoordinator(router: RouterProtocol, out: @escaping PrimaryCoordinatorOut) -> PrimaryCoordinator
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    func makeApplicationCoordinator(router: RouterProtocol) -> ApplicationCoordinator {
        return ApplicationCoordinator(router: router, coordinatorFactory: self)
    }
    
    func makeAuthorizationCoordinator(router: RouterProtocol, out: @escaping AuthorizationCoordinatorOut) -> AuthorizationCoordinator {
        return AuthorizationCoordinator(router: router, out: out)
    }
    
    func makePrimaryCoordinator(router: RouterProtocol, out: @escaping PrimaryCoordinatorOut) -> PrimaryCoordinator {
        return PrimaryCoordinator(router: router, out: out)
    }
}
