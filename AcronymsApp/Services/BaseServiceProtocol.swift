//
//  BaseService.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 7/11/21.
//

import Moya

protocol BaseServiceProtocol: AnyObject {
    associatedtype Target: TargetType
    var provider: MoyaProvider<Target> {get}
}
