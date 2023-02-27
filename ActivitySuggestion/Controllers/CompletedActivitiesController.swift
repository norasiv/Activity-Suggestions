
import UIKit

class CompletedActivitiesController: UIViewController {
    
    var completedActivitiesManager = CompletedActivitiesManager()
    var activity = [String?: [CompletedActivities]]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Completed Activities"

        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Cons.completedActivityCell, bundle: nil), forCellReuseIdentifier: Cons.completedActivityCell)

    }
    
    //will update tableview with added data every time user goes to view
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async { [self] in
            
            activity = completedActivitiesManager.fetchSavedActivities()
            tableView.reloadData()
            print(activity)
            if activity.count == 0 {
                errorAlert(errorText: "You have not completed any activities yet")
            }
        }
    }
    
}

//MARK: - tableview
extension CompletedActivitiesController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return activity.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(activity)[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cons.completedActivityCell) as! CompletedActivityCell
        let activitySaved = Array(activity)[indexPath.section].value[indexPath.row].activity
        let dateCompleted = Array(activity)[indexPath.section].value[indexPath.row].date
        cell.activityLabel.text = activitySaved
        cell.dateLabel.text = dateCompleted
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailView = storyboard?.instantiateViewController(withIdentifier: Cons.detailController) as? ActivityDetailController {
            
            let activityDetail = Array(activity)[indexPath.section].value[indexPath.row]
            
            detailView.activity = "You completed this activity: \(activityDetail.activity ?? "")"
            detailView.date = "It was completed on: \(activityDetail.date ?? "")"
            detailView.price = activityDetail.price
            self.navigationController?.pushViewController(detailView, animated: true)
        }
    }
    
}

