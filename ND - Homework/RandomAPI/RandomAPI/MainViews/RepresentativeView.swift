
//  RepresentativeView.swift
//  RandomAPI
//
//  Created by Ethan Allgaier on 12/7/25.

import SwiftUI

struct RepresentativeView: View {

    @State private var viewModel = repViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.reps.isEmpty {
                   Text("No representatives found")
               }
            List {
                ForEach(viewModel.reps) { rep in
                    VStack {
                        Text(rep.name)
                        Text(rep.district)
                    }
                }
            }
            .navigationTitle("Representatives")
            
        }
        
//SEARCH BAR  FOR ZIPCODE
        .searchable(
            text: $viewModel.zipCode,
            prompt: "Enter ZIP code"
        )
// ONCE USER HAS ENTERED A ZIPCODE
        .onSubmit(of: .search) {
            Task {
                await viewModel.loadReps()
            }
        }
//LOADS DATA
        .task {
            await viewModel.loadReps()
        }
    }
}





#Preview {
    RepresentativeView()
}





