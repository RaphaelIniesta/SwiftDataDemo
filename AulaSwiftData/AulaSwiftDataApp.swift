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
    
    @StateObject var vm = ViewController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
        .modelContainer(for: DataManager.self)
    }
}
