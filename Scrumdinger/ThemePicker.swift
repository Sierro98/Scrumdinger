//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Alejandro Sierro Galán on 23/9/23.
//

import SwiftUI

struct ThemePicker: View {
    @Binding
    var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePicker(selection: .constant(.periwinkle))
}
