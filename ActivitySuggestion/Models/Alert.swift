

import Foundation
import UIKit

extension UIViewController {
    
    func errorAlert(errorTitle: String = "oops, there was an error", errorText: String, style: UIAlertController.Style = .alert) {
        let ErrorAlert = UIAlertController(title: errorTitle, message: errorText, preferredStyle: style)
        ErrorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(ErrorAlert, animated: true, completion: nil)
    }
    
}
