//
//  MyGBUStudent2App.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//

import SwiftUI

@main
struct MyGBUStudent2App: App {
        // Set up things like persisted app states, data manager, etc. here
        @StateObject private var globalSettings = GlobalSettings() // if you have any global state

        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(globalSettings) // inject as needed
                    .onOpenURL { url in
                        // Handle Deep Links or URL schemes here if needed
                    }
            }
        }
    }

    final class GlobalSettings: ObservableObject {
        // Example global app-wide settings or user defaults can be managed here
    }
