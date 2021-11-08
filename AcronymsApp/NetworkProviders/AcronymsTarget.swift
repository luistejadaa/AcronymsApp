//
//  AcrinymsService.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 6/11/21.
//

import Moya

public enum AcronymsTarget {
    static let getDescriptionsPath = Constants.getAcronymsPath
    case getDescriptions(acronyms: String)
}

extension AcronymsTarget: TargetType {
    
    public var baseURL: URL {
        switch self {
        case .getDescriptions:
            return URL(string: Constants.baseURL)!
        }
    }
    
    public var path: String {
        switch self {
        case .getDescriptions:
            return AcronymsTarget.getDescriptionsPath
        }
    }
    
    public var method: Method {
        switch self {
        case .getDescriptions:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .getDescriptions(let acronyms):
            return .requestParameters(parameters: ["sf": acronyms], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
    
    public var sampleData: Data {
        switch self {
        case .getDescriptions(let acronyms):
            return acronyms.isEmpty ? AcronymsMock.mockEmpty : AcronymsMock.mockWithData
        }
    }
}
