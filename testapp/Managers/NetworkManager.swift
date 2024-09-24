//
//  NetworkManager.swift
//  testapp
//
//  Created by Avaz on 23/09/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    
    private init() {
        
    }
    
    // Function to retrieve a list of followers for a given GitHub username
    // Parameters:
    // - userName: The username whose followers you want to retrieve
    // - page: The page number for paginated followers list
    // - completed: A completion handler that returns either an array of Follower objects or an error message
    func getFollowers(for userName: String?, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        
        // Constructing the API endpoint URL for fetching followers
        let endpoint = baseUrl + "\(userName ?? "")/followers?per_page=100&page=\(page)"
        
        // Attempting to convert the endpoint string into a URL object
        guard let url = URL(string: endpoint) else {
            // If URL conversion fails, call the completion handler with an error
            completed(nil, "Error url")
            return
        }
        
        // Creating a data task to fetch data from the constructed URL
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // the _ is optional 
            // Check if an error occurred during the network request
            if let _ = error {
                // If an error exists, complete with an error message and return
                completed(nil, "Error dataTask")
            }
            
            // Verifying that the response is a valid HTTP response with status code 200 (success)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // If status code is not 200, return an error
                completed(nil, "Error status code")
                return
            }
            
            // Ensuring that we received valid data from the server
            guard let data = data else {
                // If no data was received, complete with an error message
                completed(nil, "Error data from server was invalid")
                return
            }
            
            do {
                // Attempt to decode the received data into an array of Follower objects
                let decoder = JSONDecoder()
                // Use convertFromSnakeCase strategy to map snake_case JSON keys to camelCase properties in Swift
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                // .self: This is used to refer to the type itself, not an instance of the type. In this case,
                // [Follower].self refers to the array type [Follower],
                // which is used when you need to pass the type as a parameter or use it in a generic context.
                let followers = try decoder.decode([Follower].self, from: data)
                // If successful, complete with the array of followers and no error
                completed(followers, nil)
            } catch {
                // If decoding fails, complete with an error message
//                completed(nil, "Error occurred while decoding data from server")
                completed(nil, error.localizedDescription)
            }
        }
        
        // Start the data task
        task.resume()
    }
    
}
