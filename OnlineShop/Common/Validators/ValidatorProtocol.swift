//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//
protocol ValidatorProtocol {
    func validated(_ value: String) throws -> String
    func isValid(_ value: String) -> Bool
}

extension ValidatorProtocol {
    
    func isValid(_ value: String) -> Bool {
        do {
            _ = try validated(value)
        } catch {
            return false
        }
        return true
    }
}
