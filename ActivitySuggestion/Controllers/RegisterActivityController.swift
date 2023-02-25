//
//  RegisterActivityController.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 25/02/2023.
//

import UIKit

class RegisterActivityController: UIViewController {
    
    var activity: Activities!
    let completedActivitiesManager = CompletedActivitiesManager()

    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDatePicker()
    }
    
    func addDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.locale = .current
        view.addSubview(datePicker)
        datePicker.center = view.center
    }
    
    func dateFormat(date:Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM YYYY"
        return formatter.string(from: date)
    }
    
    func registerActivity() {
        if let currentActivity = activity {
            
            let dateFormat = dateFormat(date:datePicker.date)
            let pickedActivity = String(currentActivity.activity)
            
            completedActivitiesManager.saveActivities(activity: currentActivity.activity, date: dateFormat)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func savePressed(_ sender: UIButton) {
        registerActivity()

    }

}
