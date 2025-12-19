//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Ethan Allgaier on 11/14/25.
//

import SwiftUI

struct StoreItem: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String?
    let artist: String?
    let description: String?
    let artworkURL: String?
    var previewUrl: String?


    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case name = "trackName"
        case artist = "artistName"
        case description
        case artworkURL = "artworkUrl100"
        case previewUrl = "previewUrl"
    }
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.artist = try container.decodeIfPresent(String.self, forKey: .artist)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.artworkURL = try container.decodeIfPresent(String.self, forKey: .artworkURL)
        self.previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl)
    }
}
struct SearchResults: Decodable {
    var results: [StoreItem]
}
enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
}
