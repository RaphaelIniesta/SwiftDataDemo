//
//  AulaSwiftDataApp.swift
//  AulaSwiftData
//
//  Created by Raphael Iniesta Reis on 19/02/24.
//

import SwiftUI
import SwiftData

@main
struct AulaSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataManager.self)
    }
}
