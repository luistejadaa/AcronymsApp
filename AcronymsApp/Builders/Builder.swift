//
//  Builder.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//

import Foundation

/// Builder protocol
protocol Builder: AnyObject {
    associatedtype TypeBuilder
    var object: TypeBuilder! { get set }
    func build() -> TypeBuilder
}
