//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import Foundation

final class ValidatorError: Error {
    
    let message: String
    
    init(_ message: String = "") {
        self.message = message
    }
}
