//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Ethan Allgaier on 11/14/25.
//

import SwiftUI

class StoreItemController {
    func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
        var url = URL(string: "https://itunes.apple.com/search")!
        //making a URL object from a string.! force unwraps
        
        var URLcomponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        // Wraps my url into URLComponents for easy modification or addin stuff
        
        URLcomponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        url = URLcomponents.url!
        //Adds your query to the URL. turning it into // https://itunes.apple.com/search?term=Radiohead&media=music&limit=5
        
        //data: the bytes downloaded .
        //response: info about the HTTP request (status code, headers, etc.).
        let (data, response) = try await URLSession.shared.data(from: URLcomponents.url!)
        //This is asking iTunes for some data
        print(data.prettyPrintedJSONString())
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw StoreItemError.itemsNotFound
                //This checks to see if i got some data, if not runs a error
        }
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(SearchResults.self, from: data)
        //decodes my search results
        
        return searchResponse.results
    }
    func fetchPreview(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}



extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
            let jsonData = try? JSONSerialization.data(
                withJSONObject: jsonObject,
                options: [.prettyPrinted]
            ),
            let prettyJSONString = String(data: jsonData, encoding: .utf8)
        else {
            print("Failed to read JSON Object.")
            return
        }
        
        print(prettyJSONString)
    }
}


