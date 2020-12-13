//
//  Result.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation


/// Generic result
/// - success Will contain the success type
/// - failure   The given API Error
enum Result<ResultType> {
    case success(ResultType)
    case failure(APIError)
}
