

import UIKit

class ActivitySuggestionController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var participantsInput: UITextField!
    
    var activities: Activities!
    var activityManager = ActivityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
            title = "Activity Suggestion"
        
            tableView.dataSource = self
            tableView.register(UINib(nibName: Cons.activityCell, bundle: nil), forCellReuseIdentifier: Cons.activityCell)
            spinnerAlert(onView: self.view)
            loadActivities()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        let registerVC = self.storyboard?.instantiateViewController(withIdentifier: Cons.registerVC) as! RegisterActivityController
        registerVC.activity = activities
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @IBAction func newActivityPressed(_ sender: UIButton) {
        spinnerAlert(onView: self.view)
        checkInputNumber()
    }
    
    
    
    //MARK: - load activities
    func loadActivities() {
        activityManager.fetchActivity(url: Cons.apiUrl) {error, result in
            
            if let error = error {
                self.stopSpinner()
                let errorText = error.localizedDescription
                DispatchQueue.main.async {
                    self.errorAlert(errorText: errorText)
                }
                print(errorText)
            } else {
                self.stopSpinner()
                self.activities = result
                DispatchQueue.main.async {
                        self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func loadActivitesByParticipants() {
        var inputNumbers = Int(participantsInput.text!)
        let urlString = "\(Cons.apiUrl)?participants=\(inputNumbers ?? 0)"
        
        activityManager.fetchActivity(url: urlString) {error, result in
            if let error = error {
                self.stopSpinner()
                let errorText = error.localizedDescription
                DispatchQueue.main.async {
                    self.errorAlert(errorText: errorText)
                }
                print(errorText)
            } else {
                self.stopSpinner()
                self.activities = result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    //MARK: - Checking inputnumber
    func checkInputNumber () {
        if Int(participantsInput.text!) ?? 0 < 100 {
            loadActivitesByParticipants()
        }
        if Int(participantsInput.text!) ?? 0 >= 100 {
            self.stopSpinner()
            errorAlert(errorText: "You can not have 100 or more participants")
        }
        if participantsInput.text == "" {
            loadActivities()
        }
    }
}
    


//MARK: - tableview
extension ActivitySuggestionController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
