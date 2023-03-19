//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

struct SignInViewModel {
    let cellType: SignInCellType
}

enum SignInCellType {
    case textField
    case title
    case button
}
