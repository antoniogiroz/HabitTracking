//
//  AddActivity.swift
//  HabitTracking
//
//  Created by Antonio Giroz on 18/10/25.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    
    let data: Activities
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark", role: .cancel) {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", systemImage: "checkmark", role: .confirm) {
                        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)                        
                        guard trimmedTitle.isEmpty == false else { return }
                        
                        let newItem = Activity(title: trimmedTitle, description: description)
                        data.activities.append(newItem)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddActivityView(data: Activities())
}
