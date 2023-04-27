//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

struct SignInViewModel {
    let cells: [SignInCellType]
    
    init(cells: [SignInCellType] = []) {
        self.cells = cells
    }
}

enum SignInCellType {
    case title(TextViewModel)
    case textField(TextFieldViewModel, UIEdgeInsets)
    case button(ActionButtonCellViewModel)
}
