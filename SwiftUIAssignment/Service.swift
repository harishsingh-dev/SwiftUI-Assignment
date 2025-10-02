//
//  Service.swift
//  SwiftUIAssignment
//
//  Created by LAP1120 on 02/10/25.
//

import Foundation



enum NetworkError: Error, LocalizedError {
    case badURL, decodingError, requestFailed

    var errorDescription: String? {
        switch self {
        case .badURL: return "Invalid URL"
        case .decodingError: return "Failed to decode data"
        case .requestFailed: return "Network request failed"
        }
    }
}

class PostService {
    func fetchPosts(completion: @escaping (Result<[Post], NetworkError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion(.failure(.badURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completion(.failure(.requestFailed))
                    return
                }

                guard let data = data else {
                    completion(.failure(.requestFailed))
                    return
                }

                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(.success(posts))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
