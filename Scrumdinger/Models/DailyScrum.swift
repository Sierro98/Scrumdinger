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
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
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
