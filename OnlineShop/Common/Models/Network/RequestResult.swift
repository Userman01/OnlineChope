//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//
enum RequestResult<T> {
    case success(T)
    case failure(NetworkError)
}
