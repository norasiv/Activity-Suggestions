//
//  ActivityModel.swift
//  ActivitySuggestion
//
//  Created by Nora Sivertsen Bull on 24/02/2023.
//

import Foundation


struct Activities : Codable {
    
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
    
}
