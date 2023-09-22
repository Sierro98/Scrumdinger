//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Alejandro Sierro Galán on 20/9/23.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        DailyScrum(
            title: "Design",
            attendees: ["Quique", "Peter", "Andrea"],
            lengthInMinutes: 10,
            theme: .yellow),
        DailyScrum(title: "Operations",
                   attendees: ["Raul", "Oscar", "Javi"],
                   lengthInMinutes: 6,
                   theme: .bubblegum),
        DailyScrum(title: "Web Dev",
                   attendees: ["Marta", "Dani", "Oscar"],
                   lengthInMinutes: 5,
                   theme: .lavender),
        DailyScrum(title: "Mobile Dev",
                   attendees: ["Ewa", "Alex"],
                   lengthInMinutes: 7,
                   theme: .oxblood)
    ]
}
