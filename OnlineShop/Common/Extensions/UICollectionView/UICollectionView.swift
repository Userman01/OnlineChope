//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    static func defaultReuseId(for elementType: UIView.Type) -> String {
        String(describing: elementType)
    }
    
    func dequeueReusableCellWithRegistration<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath, reuseId: String? = nil) -> T {
        let normalizedReuseId = reuseId ?? UICollectionView.defaultReuseId(for: T.self)
        register(type, forCellWithReuseIdentifier: normalizedReuseId)
        return dequeueReusableCell(withReuseIdentifier: normalizedReuseId, for: indexPath) as! T
    }
}
