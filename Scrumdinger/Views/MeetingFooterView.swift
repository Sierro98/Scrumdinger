//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Alejandro Sierro Galán on 27/9/23.
//

import SwiftUI

struct MeetingFooterView: View {
    
    var speakers: [ScrumTimer.Speaker]
    
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy{ $0.isCompleted }
    }
    
    
    var body: some View {
        VStack {
            HStack {
                if (isLastSpeaker) {
                    Text("Last Speaker")
                } else {
                    if let unwrappedSpeaker = speakerNumber {
                        Text("Speaker \(unwrappedSpeaker) of \(speakers.count)")
                    } else {
                        Text("No more speakers")
                    }
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
    }
}

#Preview {
    MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
        .previewLayout(.sizeThatFits)
}
