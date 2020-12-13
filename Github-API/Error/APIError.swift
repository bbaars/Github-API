//
//  APIError.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation

enum APIError: Error {
    case apiError(Error?)
    case badResponse
    case decodingError
    case invalidURL(String?)
    case unknown
}
