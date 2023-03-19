//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import Foundation

struct AuthorizationEndpoints {
    static var clientRegistrationOfNumber: String {
        return "\(BaseURL.BVC)/api/sms/send?number="
    }
    
    static var clientRecoveryOfNumber: String {
        return "\(BaseURL.BVC)/api/sms/send/forget-password?number="
    }
    
    static var clientSMSCode: String {
        return "\(BaseURL.BVC)/api/sms/check/"
    }
    
    static var clientSMSCodeRecovery: String {
        return "\(BaseURL.BVC)/api/sms/check/forget-password/"
    }
    
    static var signUp: String {
        return "\(BaseURL.BVC)/api/auth/signup"
    }
    
    static var signIn: String {
        return "\(BaseURL.BVC)/api/auth/signin"
    }
    
    static var signInRecovery: String {
        return "\(BaseURL.BVC)/api/auth/forget-password"
    }
}
