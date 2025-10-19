//
//  ActivityDetailsView.swift
//  HabitTracking
//
//  Created by Antonio Giroz on 18/10/25.
//

import SwiftUI

struct ActivityDetailsView: View {
    var data: Activities
    var activity: Activity
    
    var body: some View {
        List {
            if activity.description.isEmpty == false {
                Section {
                    Text(activity.description)
                }
            }
            
            Section {
                Text("^[Done \(activity.count) times](inflect: true)")
                
                Button("Mark as done") {
                    if let index = data.activities.firstIndex(of: activity) {
                        data.activities[index].count += 1
                    }
                }
            }
        }
        .navigationTitle(activity.title)
    }
}

#Preview {
    NavigationStack {
        ActivityDetailsView(
            data: Activities(),
            activity: Activity(title: "Title", description: "Description")
        )
    }
}
