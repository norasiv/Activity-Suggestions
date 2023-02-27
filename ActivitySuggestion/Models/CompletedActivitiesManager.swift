

import Foundation
import CoreData
import UIKit


class CompletedActivitiesManager: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var savedData = [String?: [CompletedActivities]]()
    var model = [CompletedActivities]()
    
    func saveActivities(activity: String, date: String, price: Double){
        let completedActivity = CompletedActivities(context: context)
        completedActivity.activity = activity
        completedActivity.date = date
        completedActivity.price = price
        do {
            try context.save()
            print("saved to root")
        }
        catch {
            errorAlert(errorTitle: "There was an error", errorText: "There was a problem saving your activity", style: .alert)
        }
    }
    
    
    func fetchSavedActivities() -> [String?: [CompletedActivities]] {
        do {
            model = try context.fetch(CompletedActivities.fetchRequest())
            savedData = Dictionary(grouping: model, by: {$0.date})
        }
        catch {
            errorAlert(errorTitle: "There was an error", errorText: "There was a problem fetching your activities", style: .alert)
        }
        return savedData
    }
    
}
