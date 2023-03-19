//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    
    func startAnimatingIndicator(backgroundView: LoadingBackgroundView = LoadingBackgroundView(), indicatorView: AnimatingIndicator = LoadingIndicatorView()) {
        isUserInteractionEnabled = false
        
        let backgroundView = LoadingBackgroundView()
        addSubview(backgroundView)
        backgroundView.addSubview(indicatorView)
        
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        indicatorView.snp.makeConstraints { make in
            make.left.equalTo(backgroundView.snp.left)
            make.right.equalTo(backgroundView.snp.right)
            make.centerY.equalTo(backgroundView.snp.centerY)
        }
        
        indicatorView.startAnimation()
        
        UIView.animate(withDuration: 0.3) {
            backgroundView.alpha = 1
        }
    }
    
    func stopAnimatingIndicator() {
        for subview in subviews where subview is LoadingBackgroundView {
            UIView.animate(withDuration: 0.3, animations: {
                subview.alpha = 0
            }, completion: { _ in
                subview.removeFromSuperview()
            })
        }
        isUserInteractionEnabled = true
    }
}
