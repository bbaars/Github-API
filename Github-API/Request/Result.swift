//
//  Result.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation

enum Result<ResultType> {
    case success(ResultType)
    case failure(APIError)
}
