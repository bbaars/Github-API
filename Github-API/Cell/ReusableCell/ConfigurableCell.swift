//
//  ConfigurableCell.swift
//  Github-API
//
//  Created by Brandon Baars on 12/12/20.
//

import Foundation

protocol ConfigurableCell: ReusableCell {
    associatedtype T

    func configure(with item: T)
}
