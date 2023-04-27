//
//  DirectionalLayoutMargins.swift
//  OnlineShop
//
//  Created by Петр Постников on 19.03.2023.
//

import UIKit

extension UIView {
    func setDirectionalLayoutMargins(_ margins: NSDirectionalEdgeInsets) {
        self.preservesSuperviewLayoutMargins = false
        self.directionalLayoutMargins = margins
    }
}
