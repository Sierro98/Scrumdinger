//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Alejandro Sierro Galán on 28/9/23.
//

import SwiftUI

struct NewScrumSheet: View {
    @Binding
    var isPresentingNewScrumView: Bool
    
    @Binding var scrums: [DailyScrum]
    
    @State 
    private var newScrum: DailyScrum = DailyScrum.emptyScrum
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            isPresentingNewScrumView = false
                            scrums.append(newScrum)
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheet(isPresentingNewScrumView: .constant(true), scrums: .constant(DailyScrum.sampleData))
}
