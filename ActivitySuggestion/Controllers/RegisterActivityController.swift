
import UIKit

class RegisterActivityController: UIViewController {
    
    var activity: Activities!
    let completedActivitiesManager = CompletedActivitiesManager()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Register Activity"
        
    }
    
    func dateFormat(date:Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM YYYY"
        return formatter.string(from: date)
    }

    
    func registerActivity() {
        
        if let currentActivity = activity {
            
            let dateFormat = dateFormat(date:datePicker.date)
            let pickedActivity = String(currentActivity.activity)
            let activityPrice = Double(currentActivity.price)
            completedActivitiesManager.saveActivities(activity: currentActivity.activity, date: dateFormat, price: activityPrice)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func savePressed(_ sender: UIButton) {
        registerActivity()
    }

}
