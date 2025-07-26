//
//  ContentView.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainTabView()
            .accentColor(Color(.blue)) // Use your custom accent color
            .preferredColorScheme(.light) // or .dark or remove for system default
            .onAppear {
                // Any launch logic or analytics can be placed here
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
