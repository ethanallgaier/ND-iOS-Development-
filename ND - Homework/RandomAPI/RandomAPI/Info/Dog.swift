//
//  Dog.swift
//  RandomAPI
//
//  Created by Ethan Allgaier on 12/4/25.
//

import SwiftUI
import SwiftData

@Model// for saving data
class Dog {
    var name: String
    var imageURL: String
    var id = UUID()
    
    init(name: String, imageURL: String, id: UUID = UUID()) {
        self.name = name
        self.imageURL = imageURL
        self.id = id
    }
}


struct DogAPIResponse: Codable {
    let message: String // image 
    let status: String
}



