//
//  Activity.swift
//  HabitTracking
//
//  Created by Antonio Giroz on 18/10/25.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var count = 0
}
