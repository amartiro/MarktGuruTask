//
//  SettingsView.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 05.05.25.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var settings = SettingsManager()

    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $settings.darkModeEnabled) {
                    Text(KeyConstants.Title.darkMode)
                }
            }
            .navigationTitle(KeyConstants.Title.settings)
        }
        .preferredColorScheme(settings.darkModeEnabled ? .dark : .light )
    }
}

#Preview {
    SettingsView(settings: SettingsManager())
}
