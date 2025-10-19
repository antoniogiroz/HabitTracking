//
//  Activities.swift
//  HabitTracking
//
//  Created by Antonio Giroz on 18/10/25.
//

import Observation
import SwiftUI

@Observable
class Activities {
    var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        guard
            let savedItems = UserDefaults.standard.data(forKey: "Activities"),
            let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems)
        else {
            activities = []
            return
        }
        
        activities = decodedItems
    }
}
