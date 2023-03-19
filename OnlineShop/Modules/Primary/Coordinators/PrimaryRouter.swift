//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

protocol PrimaryRouterProtocol {
    func openMain()
}

final class PrimaryRouter: PrimaryRouterProtocol {
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func openMain() {
    }
}
