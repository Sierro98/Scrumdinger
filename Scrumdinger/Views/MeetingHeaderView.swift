//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Alejandro Sierro Galán on 27/9/23.
//

import SwiftUI

struct MeetingHeaderView: View {
    @Binding
    var secondsElapsed: Int
    
    @Binding
    var secondsRemaining: Int
    
    let theme: Theme
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progressValue: Double {
        guard totalSeconds > 0 else { return 1}
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progressValue)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding(.top)
    }
}

#Preview {
    MeetingHeaderView(secondsElapsed: .constant(300), secondsRemaining: .constant(600),
                      theme: DailyScrum.sampleData[0].theme)
        .previewLayout(.sizeThatFits)
}
