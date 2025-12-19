//
//  PowerListView.swift
//  MythWorks
//
//  Created by Ethan Allgaier on 12/6/25.
//

import SwiftUI

struct PowerListView: View {
    let dragon: Dragon
    @Environment(AppSettings.self) private var settings

    var body: some View {
        ZStack {
            settings.backgroundColor.ignoresSafeArea()
            VStack {
                Divider()
                Text("Powers:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .font(Font.title3.bold())
                
                
                ForEach(dragon.abilities, id: \.self) { ability in
                    Text("• \(ability)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .font(.subheadline)
                .foregroundColor(.secondary)
                Spacer()
                
            }
        }
        
        .navigationTitle("\(dragon.name)'s Powers")
        
        .navigationBarTitleDisplayMode(.large)

        
    }
    

}
