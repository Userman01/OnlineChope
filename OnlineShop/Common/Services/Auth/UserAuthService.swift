//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit
import KeychainSwift

final class UserAuthService {
    static let shared = UserAuthService()
    
    var username: String?
    var password: String?
    
    func isUserAuthorized() -> Bool {
        let keychain = KeychainSwift()
        return keychain.get(KeychainKeys.userName) != nil && keychain.get(KeychainKeys.accessToken) != nil
    }
}
