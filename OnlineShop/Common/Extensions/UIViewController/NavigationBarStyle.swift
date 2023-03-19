//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

enum NavigationBarStyle {
    case primary
    case clear
}

extension UIViewController {
    
    func setNavigationBarStyle(_ style: NavigationBarStyle, isLargeTitle: Bool = false, isNeedToFit: Bool = true) {
        switch style {
        case .primary:
            setStyle(
                backgroundColor: .dynamic(light: R.color.barStyleLight(), dark: R.color.barStyleDark()),
                titleColor: R.color.white(),
                tintColor: R.color.white())
        case .clear:
            setStyle(backgroundColor: .backgroundColor,
                     titleColor: R.color.white(),
                     tintColor: R.color.white())
        }
        extendedLayoutIncludesOpaqueBars = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = isLargeTitle ? .always : .never
    }
    
    private func setStyle(backgroundColor: UIColor!, titleColor: UIColor!, tintColor: UIColor!) {
        navigationController?.navigationBar.tintColor = tintColor
        navigationController?.navigationBar.isTranslucent = true

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = backgroundColor

        if let titleColor = titleColor {
            appearance.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: titleColor,
                NSAttributedString.Key.font: UIFont.font20Regular
            ]
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
        }
        appearance.shadowColor = nil
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
