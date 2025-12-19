/*:
## App Exercise - Workout API
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 Your workout app now features a server-side API for users to upload and retrieve their workout data to use across multiple devices. For simplicity's sake, we will not be using a real API for this exercise. Below, an APIRequest protocol has been provided, alongside a sample implementation for a `GetUserRequest` API call.
 */
import Foundation


protocol APIRequest {
    associatedtype Response
    var urlRequest: URLRequest { get }
    func decodeResponse(data: Data) throws -> Response
}


struct User: Codable {
    let username: String
}


struct GetUserRequest: APIRequest {
    typealias Response = User
    let urlRequest: URLRequest
    
    init(username: String) {
        // Construct path to API call (base url omitted for simplicity's sake)
        var urlComponents = URLComponents()
        urlComponents.path = "/users"
        urlComponents.queryItems = [URLQueryItem(name: "username", value: username)]
        
        urlRequest = URLRequest(url: urlComponents.url!)
    }
    
    func decodeResponse(data: Data) throws -> User {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(User.self, from: data)
    }
}

//:  Below, a class for processing APIRequests has been started for you. The performRequest function uses a generic so that it can be called with any APIRequest, and will return the appropriate type specified by that request's Response type alias. Try calling the function: first, initialize a GetUserRequest, then call performRequest(_:), passing in the GetUserRequest you created and storing the result in a constant `user`. In a comment, answer: What type will `user` be, and where was that type derived from?

class WorkoutAPIService {
    func performRequest<R: APIRequest>(_ request: R) async throws -> R.Response {
        let (data, response) = try await URLSession.shared.data(for: request.urlRequest)

        // You can add HTTP status code validation here if needed:
        if let httpResponse = response as? HTTPURLResponse,
           !(200..<300).contains(httpResponse.statusCode) {
            throw URLError(.badServerResponse)
        }

        return try request.decodeResponse(data: data)
    }
}


var getUserRequest = GetUserRequest(username: "Ethan")
var apiService = WorkoutAPIService()

Task {
    do {
        let user = try await apiService.performRequest(getUserRequest)
        print(user.username)
    } catch {
        print("Error")
    }
}
// user is a type User. this comes from the GetUserRequest struct

//:  Create another struct, `GetRecentWorkoutRequest` that conforms to APIRequest. The url path should be "/workout/getLast/", with no query items needed. The response type should be `Workout`, which you will need to create as a struct as well; for simplicity's sake you can leave the struct empty with no parameters, but it will need to conform to Codable..
struct Workout: Codable {   }





struct GetRecentWorkoutRequest: APIRequest {
    
    //When i get a response it should be turned into a workout.
    typealias Response = Workout
    
    
    private let baseURL = URL(string: "https://WorkoutClass.com")!

    var urlRequest: URLRequest {
        //pathway
        let url = baseURL.appending(component: "/workout/getLast/")// where we want to go
        
        var request = URLRequest(url: url)//The envolope that gets sent to the server
        
        
        request.httpMethod = "GET"// asking for info
        
        return request
        
    }
    //this function opens data, turning JSON into swift object my app could use
    func decodeResponse(data: Data) throws -> Workout {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(Workout.self, from: data)
    }
    
//    var queryItems: [URLQueryItem]? { nil }
}
    
//:  Try calling WorkoutAPIService.performRequest(_:) again, this time with your new GetRecentWorkoutRequest. In a comment, answer: What type will the function return this time, and where was that type derived from?
var workoutRequest = GetRecentWorkoutRequest()
var apiServiceWorkout = WorkoutAPIService()


Task {
    do {
        let user = try await apiService.performRequest(workoutRequest)
        print("Got the workout data")
    } catch {
        print("error getting workout data")
    }
}


// It will return a Workout
// derived from Workout in GetRecentWorkoutRequest.typealias Response = Workout
/*:
 [Previous](@previous)  |  page 4 of 4
  */
