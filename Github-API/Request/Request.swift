//
//  Request.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation
import os

class Request {
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Request")

    /// Performs a GET request to the following endpoint
    /// - Parameters:
    ///   - endpoint: The endpoint to get
    ///   - completion: Completion the result type with either a success of failure
    func get<T: Codable>(_ endpoint: Endpoint, completion: @escaping (_ result: Result<T>) -> Void) {
        guard let url = endpoint.url else {
            return completion(.failure(.invalidURL(endpoint.url?.absoluteString)))
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Make sure the result is within the 200 status range
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                return completion(.failure(.badResponse))
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    let result = try decoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch let error {
                    self.logger.error("Error decoding response = \(error.localizedDescription)")
                    completion(.failure(.decodingError))
                }
            } else {
                self.logger.error("There was no data returned from request = \(url)")
                completion(.failure(.unknown))
            }
        }

        task.resume()
    }
}
