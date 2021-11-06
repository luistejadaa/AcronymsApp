//
//  AcronymsMock.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 6/11/21.
//

import Foundation

// swiftlint:disable force_try
struct AcronymsMock {
    static let mock = try! JSONEncoder().encode([
        Acronyms(sf: "HHM", lfs: [
            LongForm(lf: "heavy meromyosin", freq: 267, since: 1997),
            LongForm(lf: "heavy meromyosin", freq: 268, since: 1998),
            LongForm(lf: "heavy meromyosin", freq: 269, since: 1999),
            LongForm(lf: "heavy meromyosin", freq: 270, since: 2000)
        ])
    ])
}
