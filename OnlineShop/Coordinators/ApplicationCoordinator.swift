//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private var router: RouterProtocol
    private var isAutorized = false
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        if isAutorized {
            runMainFlow()
        } else {
            runAuthFlow()
        }
    }
    
    private func runMainFlow() {
        
    }
    
    private func runAuthFlow() {
        let authorizationCoordinator = coordinatorFactory.makeAuthorizationCoordinator(router: router) { [weak self] cmd in
            switch cmd {
            case .openPrimary:
                self?.runPrimaryFlow()
            }
        }
        addDependency(authorizationCoordinator)
        authorizationCoordinator.start()
    }
    
    private func runPrimaryFlow() {
        let primaryCoordinator = coordinatorFactory.makePrimaryCoordinator(router: router) { [weak self] cmd in
            print(cmd)
        }
        removeAllDependency()
        addDependency(primaryCoordinator)
        primaryCoordinator.start()
    }
}
