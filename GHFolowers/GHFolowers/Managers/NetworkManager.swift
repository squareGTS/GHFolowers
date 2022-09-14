//
//  NetworkManager.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 14.09.2022.
//

import Foundation

class NetworkManger {

    static let shared = NetworkManger()
    let baseURL = "https://api.github.com/users/"

    private init() {}

    func getFolowers(for username: String, page: Int, completed: @escaping ([Folowers]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"

        guard let url = URL(string: endpoint) else { return }
        completed(nil, "This user created an invalid request. Please try again.")

       URLSession.shared.dataTask(with: url) { data, response, error in

            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection.")
                return
            }

            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try again.")
                return
            }

            guard let data = data else {
                completed(nil, "The data received from the server was invalid. Please try again")
                return
            }

           do {
               let decoder = JSONDecoder()
               decoder.keyDecodingStrategy = .convertFromSnakeCase
               let followers = try decoder.decode([Folowers].self, from: data)
               completed(followers, nil)
           } catch {
               completed(nil, "The data received from the server was invalid. Please try again")
           }


        }.resume()

    }

}
