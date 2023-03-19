//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import Foundation

typealias PrimaryCoordinatorOut = (PrimaryCoordinatorOutCmd) -> Void
enum PrimaryCoordinatorOutCmd {
}

final class PrimaryCoordinator: BaseCoordinator {
    private let primaryRouter: PrimaryRouterProtocol
    private let out: PrimaryCoordinatorOut
    
    init(router: RouterProtocol, out: @escaping PrimaryCoordinatorOut) {
        self.out = out
        primaryRouter = PrimaryRouter(router: router)
    }
    
    override func start() {
        openMain()
    }
    
    private func openMain() {
        primaryRouter.openMain()
    }
}
