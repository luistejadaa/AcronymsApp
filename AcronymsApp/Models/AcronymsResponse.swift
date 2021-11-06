//
//  AcronymsResponse.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 6/11/21.
//

import Foundation

struct Acronyms: Codable {
    let sf: String
    let lfs: [LongForm]
}

struct LongForm: Codable {
    let lf: String
    let freq: Int
    let since: Int
}
