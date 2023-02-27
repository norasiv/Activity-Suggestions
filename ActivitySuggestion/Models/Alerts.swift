

import Foundation
import UIKit

extension UIViewController {
    
    func errorAlert(errorTitle: String = "oops, there was an error", errorText: String, style: UIAlertController.Style = .alert) {
        let ErrorAlert = UIAlertController(title: errorTitle, message: errorText, preferredStyle: style)
        ErrorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(ErrorAlert, animated: true, completion: nil)
    }
    
}


var spinner : UIView?
extension UIViewController {
    
    func spinnerAlert(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.style = .large
        indicator.center = spinnerView.center

        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            onView.addSubview(spinnerView)
        }
        spinner = spinnerView
    }
    
    func stopSpinner() {
        DispatchQueue.main.async {
            spinner?.removeFromSuperview()
            spinner = nil
        }
    }
    
}
