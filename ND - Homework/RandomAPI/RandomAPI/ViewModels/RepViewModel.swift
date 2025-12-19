//
//  RepViewModel.swift
//  RandomAPI
//
//  Created by Ethan Allgaier on 12/10/25.
//

import SwiftUI

//HOLD THE DATA FOR TJE VIEW
//LOADS THE API DATA FOR THE VIEW
@Observable
class repViewModel {
    
    var zipCode: String = "84042"//SEARCH BAR
    var reps: [Representative] = []
    var errorMessage: String?
    
    private let api = RepAPIController()
    
//LOAD DATA FROM THE API
    func loadReps() async {

//PREVENTS EMPTY SEARCHES
       guard zipCode.count == 5 else {return}
        
        do {
            reps = try await api.fetchRep(zip: zipCode)
            errorMessage = nil
        } catch {
            print("Error fetching reps: \(error)")
            errorMessage = "Error fetching reps. Please try again."
        }
    }
}






