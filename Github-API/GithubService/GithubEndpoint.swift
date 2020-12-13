//
//  GithubEndpoint.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation

struct GithubEndpoint: Endpoint {
    var path: String

    static func getCommits() -> GithubEndpoint {
        return GithubEndpoint(
            path: "/repos/vapor/vapor/commits"
        )
    }

    public var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = path

        return components.url
    }
}
