//
//  Settings.swift
//  MythWorks
//
//  Created by Ethan Allgaier on 12/6/25.
//

import SwiftUI

@Observable
class AppSettings  {
    var backgroundColor: Color = .black
}

//====================================================
struct Settings: View {
    
    @Environment(AppSettings.self) private var settings

    var body: some View {
        @Bindable var bindableSettings = settings
        ZStack {
            settings.backgroundColor.ignoresSafeArea()
            
            Form {
                Section(header: Text("Appearance")) {
                    ColorPicker("Background Color", selection: $bindableSettings.backgroundColor)
                }
                
                Section {
                    Button("Reset to Black") {
                        settings.backgroundColor = .black
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Settings")
    }
}
