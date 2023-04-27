//
//  ActionButtonCellViewModel.swift
//  OnlineShop
//
//  Created by Петр Постников on 19.03.2023.
//

import UIKit

struct ActionButtonCellViewModel {
    let title: String
    let isEnabled: Bool
    let margins: NSDirectionalEdgeInsets
    let backgroundColor: UIColor!
    let style: ActionButton.ButtonStyle

    init(title: String,
         isEnabled: Bool,
         margins: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(
            top: .spacing40Pt,
            leading: .spacing36Pt,
            bottom: .spacing40Pt,
            trailing: .spacing36Pt),
         backgroundColor: UIColor! = .backgroundColor,
         style: ActionButton.ButtonStyle = .primary) {
        self.title = title
        self.isEnabled = isEnabled
        self.margins = margins
        self.backgroundColor = backgroundColor
        self.style = style
    }
}
