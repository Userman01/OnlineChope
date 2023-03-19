//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//
import UIKit

extension UIView {
    
    func addGestureRecognizerEndEditing(delegate: UIGestureRecognizerDelegate? = nil) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = delegate
        addGestureRecognizer(tapGesture)
    }
}
