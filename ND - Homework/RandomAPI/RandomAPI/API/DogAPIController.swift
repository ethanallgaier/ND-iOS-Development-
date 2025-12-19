//
//  DogAPIControllerProtocol.swift
//  RandomAPI
//
//  Created by Ethan Allgaier on 12/4/25.
//

import SwiftUI

class DogAPIController: DogAPIControllerProtocol {
    func fetchRandomDog() async throws -> String {
        let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(DogAPIResponse.self, from: data)
        return response.message
    }
}



// Use this protocol for the  DogAPIController so im able to test/chnage things without causing problems.
//It makes the code easier to swap, test, and change later.
//Able to work with anyhing not just one class
protocol DogAPIControllerProtocol {
    func fetchRandomDog() async throws -> String
}
