//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//
import UIKit

extension UIColor {
    
    static func dynamic(light: UIColor!, dark: UIColor!) -> UIColor? {
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light}
    }
    
    static let backgroundColor = dynamic(light: R.color.backgroundColorLight(), dark: R.color.backgroundColorDark())
}
