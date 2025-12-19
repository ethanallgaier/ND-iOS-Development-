//
//  ContentView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//




import SwiftUI

@Observable
class StoreItemListViewModel {
    var items: [StoreItem] = []
    var searchText = ""
    var selectedMediaType: MediaType = .music
    var storeItemController = StoreItemController()
    var previewTask: Task<Void, Never>? = nil

    func fetchMatchingItems() {
        // if the search bar is empty then STOP
        guard !searchText.isEmpty  else { return }
    
        //stuff we sent to apple
        let query: [String : String] = [
            "term": searchText,// what the user searches
            "media": selectedMediaType.rawValue, //what kind of thing we want
            "limit": "25", //amount of results
            "lang": "en_us" //Only show U.S. English results
        ]
        
        // go fetch ( try to talk to the internet )
        Task {
            do {
                // try to get info from iTunes API
                //await cause its the internet and it takes some time
                let fetchedItems = try await storeItemController.fetchItems(matching: query)
                
                //putting the data collected into items: [StoreItem] array
                await MainActor.run {
                    self.items = fetchedItems
                }
              
                // If something breaks (WiFi, bad JSON,  etc ),
                // show the error so you know what happened.
            } catch {
                print("Failed to fetch items: \(error)")
            }
        }
    }
    
    func fetchPreview(item: StoreItem) {
        if let previewTask {
            previewTask.cancel()
        }
        previewTask = Task { // Code to fetch the preview data using the URL
                                
            // Once the task is complete, return the stored task value to nil
            previewTask = nil
        }
    }
    
}






struct StoreItemListView: View {
    @State private var viewModel = StoreItemListViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Media Type", selection: $viewModel.selectedMediaType) {
                    ForEach(MediaType.allCases, id: \.self) { mediaType in
                        Text(mediaType.rawValue.capitalized)
                    }
                    }
                .onChange(of: viewModel.selectedMediaType) {
                    viewModel.fetchMatchingItems()
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.horizontal, .top])


                HStack {
                    TextField("Search…", text: $viewModel.searchText)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.search)
                        .onSubmit {
                            viewModel.fetchMatchingItems()
                        //when the user enters something into the search bar it will show results
                       
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .submitLabel(.search)
                    .padding([.horizontal, .bottom])
                }
                
                List(viewModel.items) { item in
                    ItemCellView(item: item) {
                viewModel.fetchPreview(item: item)
                        
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("iTunes Search")
            .onAppear {
                viewModel.searchText = "Example"
                //default search ^
                viewModel.fetchMatchingItems()
            }
        }
    }
}

#Preview {
 StoreItemListView()
}

