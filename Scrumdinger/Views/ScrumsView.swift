//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Alejandro Sierro Galán on 21/9/23.
//

import SwiftUI

struct ScrumsView: View {
    @Binding
    var scrums: [DailyScrum]
    
    @State
    private var isPresentingNewScrum: Bool = false
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .sheet(isPresented: $isPresentingNewScrum) {
                NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrum, scrums: $scrums)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrum = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Add new Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData))
    }
}
