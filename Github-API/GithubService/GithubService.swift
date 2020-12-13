//
//  GithubService.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation

class GithubService {
    func getCommits(completion: @escaping (_ result: Result<[Commit]>) -> Void) {
        let request = Request()
        request.get(GithubEndpoint.getCommits(), completion: completion)
    }
}
