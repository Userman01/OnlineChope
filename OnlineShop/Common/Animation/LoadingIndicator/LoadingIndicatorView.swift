//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

final class LoadingIndicatorView: UIView {
    
    private lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.animation = AnimationType.getAnimation(of: .inProgress, for: traitCollection)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(animationView)
        
        animationView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension LoadingIndicatorView: AnimatingIndicator {
    
    func startAnimation() {
        animationView.play()
    }
}
