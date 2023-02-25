//
//  CompletedActivitiesControllerViewController.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 25/02/2023.
//

import UIKit

class CompletedActivitiesController: UIViewController {
    
    var completedActivitiesManager = CompletedActivitiesManager()
    var activity = [String?: [CompletedActivities]]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Cons.completedActivityCell, bundle: nil), forCellReuseIdentifier: Cons.completedActivityCell)


    }
    
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


extension CompletedActivitiesController: UITableViewDataSource, UITableViewDelegate {
    
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
    
}
