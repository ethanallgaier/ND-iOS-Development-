
import SwiftUI



protocol RepAPIControllerProtocol {
    func fetchRep(zip: String) async throws -> [Representative]
}

class RepAPIController: RepAPIControllerProtocol {
    //fetch reps
    func fetchRep(zip: String) async throws -> [Representative] {
        
// API URL, TELLS THE API TO SEND JSON
        let urlString = "https://whoismyrepresentative.com/getall_mems.php?zip=\(zip)&output=json"

        //CONVERTS STRING INTO URL
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
//DOWNLOAD DATA FROM INTERNET
        let (data, _) = try await URLSession.shared.data(from: url)
 
//JUST TO SEE WHAT IM GETTING BACK
        if let jsonString = String(data: data, encoding: .utf8) {
               print("API Response: \(jsonString)")
           }
           
//CONVERT JSON DATA INTO SWIFT STRUCTS
        let decoded = try JSONDecoder().decode(RepResponse.self, from: data)
        return decoded.results
    }
}


