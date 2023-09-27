//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Alejandro Sierro Galán on 27/9/23.
//

import SwiftUI

struct MeetingFooterView: View {
    @Binding
    var speakers: [ScrumTimer.Speaker]
    
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    var body: some View {
        HStack {
            Text("Speaker 1 of 3")
            Spacer()
            Button(action: {}) {
                Image(systemName: "forward.fill")
            }
            .accessibilityLabel("Next speaker")
        }
    }
}

#Preview {
    MeetingFooterView(speakers: .constant(DailyScrum.sampleData[0].attendees.speakers), skipAction: {})
        .previewLayout(.sizeThatFits)
}
