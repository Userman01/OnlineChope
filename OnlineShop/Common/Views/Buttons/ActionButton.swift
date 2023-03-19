//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//
import UIKit

class ActionButton: UIButton {
    
    private enum ViewMetrics {
        static let primaryTitleColor: UIColor! = .dynamic(light: R.color.primaryTitleColorLight(), dark: R.color.primaryTitleColorDark())
        
        static let primaryBackgroundColor: UIColor! = .dynamic(light: R.color.primaryBackgroundColorLight(), dark: R.color.primaryBackgroundColorDark())
        static let primaryHighlightedColor: UIColor! = .dynamic(light: R.color.primaryHighlightedColorLight(), dark: R.color.primaryHighlightedColorDark())
        static let heightNormal: CGFloat = 56.0
        static let cornerRadius: CGFloat = 28.0
    }
    
    enum ButtonStyle {
        case primary
    }
    
    enum ButtonHeightType {
        case normal
    }
    
    var buttonStyle: ButtonStyle
    var heightType: ButtonHeightType
    
    required init(
        frame: CGRect = .zero,
        style: ButtonStyle = .primary,
        heightType: ButtonHeightType = .normal,
        title: String? = nil
    ) {
        self.buttonStyle = style
        self.heightType = heightType
        super.init(frame: frame)
        setup(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(title: String? = nil) {
        switch buttonStyle {
        case .primary:
            titleLabel?.font = .font16Regular
            titleLabel?.adjustsFontForContentSizeCategory = true
            setTitleColor(ViewMetrics.primaryTitleColor, for: .normal)
            setTitle(title, for: .normal)
            backgroundColor = ViewMetrics.primaryBackgroundColor
            layer.cornerRadius = ViewMetrics.cornerRadius
        }
    }

    override var intrinsicContentSize: CGSize {
        switch heightType {
        case .normal:
            return CGSize(width: frame.size.width, height: ViewMetrics.heightNormal)
        }
    }
    
    func setButtonStyle(_ style: ButtonStyle) {
        buttonStyle = style
        setup(title: titleLabel?.text)
    }
}
extension ActionButton {
    
    override var isEnabled: Bool {
        didSet {
            if buttonStyle == .primary {
                backgroundColor = isEnabled ? ViewMetrics.primaryBackgroundColor : ViewMetrics.primaryHighlightedColor
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            switch buttonStyle {
            case .primary:
                backgroundColor = isHighlighted ? ViewMetrics.primaryHighlightedColor : ViewMetrics.primaryBackgroundColor
            }
        }
    }
}
