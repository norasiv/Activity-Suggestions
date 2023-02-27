//
//  CompletedActivities+CoreDataProperties.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 27/02/2023.
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
    @NSManaged public var price: Double

}

extension CompletedActivities : Identifiable {

}
