//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import Foundation

extension String {

    func masked(pattern: String, replacementCharacter: Character) -> String {
        var string = ""
        var index = self.startIndex
        for char in pattern {
            if index == self.endIndex {
                break
            }
            if char == replacementCharacter {
                string.append(self[index])
                index = self.index(after: index)
            } else {
                string.append(char)
            }
        }
        return string
    }
}
