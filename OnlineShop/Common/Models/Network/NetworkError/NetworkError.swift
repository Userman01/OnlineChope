//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import Foundation

struct NetworkError {
    
    let errorMessage: String
    let errorModel: Decodable?
    let response: HTTPURLResponse?
    
    init(errorMessage: String = R.string.localizable.commonErrorMessage(),
         errorModel: Decodable? = nil,
         response: HTTPURLResponse? = nil) {
        self.errorMessage = errorMessage
        self.errorModel = errorModel
        self.response = response
    }
}
