//
//  ViewController.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 24/02/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var activities: Activities!
    var activityManager = ActivityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tableView.dataSource = self
            tableView.register(UINib(nibName: Cons.activityCell, bundle: nil), forCellReuseIdentifier: Cons.activityCell)
            loadActivities()
    }
    
    
    @IBAction func newActivityPressed(_ sender: UIButton) {
        loadActivities()
    }
    
    func errorAlert(errorTitle: String = "oops, there was an error", errorText: String, style: UIAlertController.Style = .alert) {
        let ErrorAlert = UIAlertController(title: errorTitle, message: errorText, preferredStyle: style)
        ErrorAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(ErrorAlert, animated: true, completion: nil)
    }
    
    //MARK: - load activities
    func loadActivities() {
        activityManager.fetchActivity(url: Cons.apiUrl) {error, result in
            if let error = error {
                let errorText = error.localizedDescription
                DispatchQueue.main.async {
                    self.errorAlert(errorText: errorText)
                }
                print(errorText)
            } else {
                self.activities = result
                DispatchQueue.main.async {
                        self.tableView.reloadData()
                }
            }
        }
    }
    
    
}


//MARK: - tableview
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activities = activities
        let cell = tableView.dequeueReusableCell(withIdentifier: Cons.activityCell, for: indexPath)
        as! ActivityCell
        cell.activityLabel.text = "Activity: \(activities?.activity ?? "")"
        cell.typeLabel.text = "Type: \(activities?.type ?? "")"
        cell.participantsLabel.text = "Participants: \(activities?.participants ?? 0)"
        cell.priceLabel.text = "Price: \(activities?.price ?? 0.0),-"
        cell.linkLabel.text = "Link: \(activities?.link ?? "")"
        cell.keyLabel.text = "Key: \(activities?.key ?? "")"
        cell.accessLabel.text = "Accessibility: \(activities?.accessibility ?? 0.0)"
        return cell
        }
        
    }


//MARK: - spinner
//extension UIViewController {
//    func spinnerAlert(onView : UIView) -> UIAlertController {
//        let alert = UIAlertController(title: "Loading activty", message: "Henter ny aktivitet", preferredStyle: .alert)
//        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
//        indicator.hidesWhenStopped = true
//        indicator.startAnimating()
//        indicator.style = .large
//        alert.view.addSubview(indicator)
//        present(alert, animated: true, completion: nil)
//        return alert
//    }
//
//    func stopSpinner(spinnerAlert: UIAlertController) {
//        DispatchQueue.main.async {
//            spinnerAlert.dismiss(animated: true, completion: nil)
//        }
//    }
//}
    

