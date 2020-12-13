//
//  EndPoint.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation

protocol Endpoint {
    var path: String { get set }
    var url: URL? { get }
}
