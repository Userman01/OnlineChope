//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//
import UIKit

struct PhoneValidator: ValidatorProtocol {
    
    func validated(_ value: String) throws -> String {
        guard Int(value) != nil && value.count == 11 else {
            throw ValidatorError()
        }
        return value
    }
}
