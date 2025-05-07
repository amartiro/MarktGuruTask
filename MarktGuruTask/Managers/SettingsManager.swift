//
//  SettingsManager.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 06.05.25.
//

import SwiftUI

final class SettingsManager: ObservableObject {
    @AppStorage("dark_mode") var darkModeEnabled: Bool = false
}
