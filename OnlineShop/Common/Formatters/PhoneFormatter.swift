//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import Foundation

final class PhoneFormatter: Formatter {
    
    private let contactWorker: ContactWorkerProtocol = ContactWorker()
    
    private let allowedChars = "0123456789"
    
    override func string(for obj: Any?) -> String? {
        if let string = removeNotAllowedChars(in: obj as? String) {
            return formattedPhoneNumber(in: string)
        }
        return nil
    }
    
    override func editingString(for obj: Any) -> String? {
        string(for: obj)
    }
    
    private func formattedPhoneNumber(in text: String) -> String {
        var text: String = text
        let regexOne = "^[\\d]"
        text = text.replacingOccurrences(of: regexOne, with: "7", options: .regularExpression)
        text = contactWorker.getFormattedPhoneNumber(text, format: .separate)
        return text
    }
    
    private func removeNotAllowedChars(in string: String?) -> String? {
            string?.filter { allowedChars.contains($0) }
        }
}
