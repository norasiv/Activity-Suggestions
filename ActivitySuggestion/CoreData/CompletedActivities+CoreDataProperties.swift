//
//  CompletedActivities+CoreDataProperties.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 25/02/2023.
//
//

import Foundation
import CoreData


extension CompletedActivities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CompletedActivities> {
        return NSFetchRequest<CompletedActivities>(entityName: "CompletedActivities")
    }

    @NSManaged public var activity: String?
    @NSManaged public var date: String?

}

extension CompletedActivities : Identifiable {

}
