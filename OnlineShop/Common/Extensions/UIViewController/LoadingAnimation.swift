//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//
import UIKit

extension UIViewController {
    
    func startFullScreenAnimatingIndicator(backgroundView: LoadingBackgroundView = LoadingBackgroundView(), indicatorView: AnimatingIndicator = LoadingIndicatorView()) {
        guard let applicationDelegate: SceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate,
              let window: UIWindow = applicationDelegate.window else { return }
        window.startAnimatingIndicator(backgroundView: backgroundView, indicatorView: indicatorView)
    }
    
    func stopFullScreenAnimatingIndicator() {
        guard let applicationDelegate: SceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate,
              let window: UIWindow = applicationDelegate.window else { return }
        window.stopAnimatingIndicator()
    }
}
