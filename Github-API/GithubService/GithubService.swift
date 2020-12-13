//
//  GithubService.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation

class GithubService {

    /// Get the commits for the vapor repo
    /// - Parameter completion: The result of either the commits or the error if one occurred
    func getCommits(completion: @escaping (_ result: Result<[Commit]>) -> Void) {
        let request = Request()
        request.get(GithubEndpoint.getCommits(), completion: completion)
    }
}
