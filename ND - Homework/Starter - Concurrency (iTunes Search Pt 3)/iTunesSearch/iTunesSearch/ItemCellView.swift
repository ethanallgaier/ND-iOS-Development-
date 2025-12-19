//
//  ItemCellView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI

struct ItemCellView: View {
    let item: StoreItem
    var onPlayButtonPressed: () -> Void
    var body: some View {
        HStack {
            if let urlString = item.artworkURL,
               let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.gray)
            }
            VStack(alignment: .leading) {
                Text(item.name ?? "Unknown")
                    .font(.headline)

                Text(item.artist ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            Button {
                onPlayButtonPressed()
                } label: {
                    Image(systemName: "play.circle")
                }
            }
        }
    }
}




