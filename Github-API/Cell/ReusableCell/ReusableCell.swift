//
//  ReusableCell.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation

protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

extension ReusableCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
