//
//  Created by postnikov_pp on 15/03/2023.
//  Copyright (c) 2023 postnikovpp. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alert(title: String? = "", message: String? = "", okTitle: String = R.string.localizable.commonOK()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: okTitle, style: .default))
        self.present(alertController, animated: true)
    }
}
