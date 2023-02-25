//
//  CompletedActivitiesManager.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 25/02/2023.
//

import Foundation
import CoreData
import UIKit


class CompletedActivitiesManager: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var activities: Activities!
    
    var savedData = [String?: [CompletedActivities]]()
    var model = [CompletedActivities]()
    var numberOfCompletedActivities = 0
    
    
    func saveActivities(activity: String, date: String){
        let newActivity = CompletedActivities(context: context)
        newActivity.activity = activity
        newActivity.date = date
        do {
            try context.save()
        }
        catch {
            errorAlert(errorTitle: "There was an error", errorText: "There was a problem saving your activity", style: .alert)
        }
    }
    
    
    func fetchSavedActivities() {
        do {
            model = try context.fetch(CompletedActivities.fetchRequest())
            savedData = Dictionary(grouping: model, by: {$0.date})
        }
        catch {
            errorAlert(errorTitle: "There was an error", errorText: "There was a problem fetching your activities", style: .alert)
        }
    }
    
}
