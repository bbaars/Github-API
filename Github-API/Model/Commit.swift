//
//  Commit.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation

struct Commit: Codable {
    let sha: String
    let author: Author
    let commit: Commit.Info
}
