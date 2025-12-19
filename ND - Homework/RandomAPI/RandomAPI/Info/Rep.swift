//
//  Rep.swift
//  RandomAPI
//
//  Created by Ethan Allgaier on 12/10/25.
//

import SwiftUI



struct Representative: Identifiable, Decodable {
    var id = UUID()//fake it because api doesnt have this one
    var name: String
    var state: String
    var district: String
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case state = "state"
        case district = "district"
    }
    
  
   
}


struct RepResponse: Decodable {
    var results: [Representative]
}

