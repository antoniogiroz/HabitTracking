//
//  ContentView.swift
//  HabitTracking
//
//  Created by Antonio Giroz on 18/10/25.
//

import SwiftUI


struct ContentView: View {
    @State private var data = Activities()
    @State private var isCreating = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.activities) { activity in
                    NavigationLink {
                        // If we used NavigationLink(value: activity), SwiftUI would pass the activity in once, when the view was created, but wouldn't automatically refresh the view when the activity changed – trying to change the completion count wouldn't work properly, because although the underlying data changes it wouldn't cause the destination view to be recreated.
                        // By using this simpler form of NavigationLink, modifying the completion count causes SwiftUI will automatically recreate the whole destination view for us too. It's a subtle distinction, but an important one.
                        ActivityDetailsView(data: data, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.title)
                            Spacer()
                            Text(String(activity.count))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: activity))
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracking")
            .sheet(isPresented: $isCreating) {
                AddActivityView(data: data)
            }
            .toolbar {
                ToolbarItem {
                    Button("Add new", systemImage: "plus") {
                        isCreating = true
                    }
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        data.activities.remove(atOffsets: offsets)
    }
    
    func color(for activity: Activity) -> Color {
        if activity.count < 3 {
            .red
        } else if activity.count < 10 {
            .orange
        } else if activity.count < 20 {
            .green
        } else if activity.count < 50 {
            .blue
        } else {
            .indigo
        }
    }
}

#Preview {
    ContentView()
}
