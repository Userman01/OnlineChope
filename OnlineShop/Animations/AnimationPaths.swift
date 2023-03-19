//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit
import Lottie

enum AnimationType {
    
    // В обработке
    case inProgress

    static func getAnimation(of animationType: AnimationType, for traitCollection: UITraitCollection) -> LottieAnimation! {
        let isDark = traitCollection.userInterfaceStyle == .dark
        var path: String?
        
        switch animationType {
        case .inProgress:
            path = isDark ? R.file.preloaderJson.path() : R.file.preloaderJson.path()
            return LottieAnimation.filepath(path ?? "")
        }
    }
}
