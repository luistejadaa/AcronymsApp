//
//  AcrinymsService.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 6/11/21.
//

import Moya

public enum AcronymsProvider {
    static let getDescriptionsPath = "software/acromine/rest.html/software/acromine/dictionary.py"
    case getDescriptions(acronyms: String)
}

extension AcronymsProvider: TargetType {
    
    public var baseURL: URL {
        switch self {
        case .getDescriptions:
            return URL(string: Constants.baseURL)!
        }
    }
    
    public var path: String {
        switch self {
        case .getDescriptions:
            return AcronymsProvider.getDescriptionsPath
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
        case .getDescriptions:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
    
    public var sampleData: Data {
        switch self {
        case .getDescriptions:
            return AcronymsMock.mock
        }
    }
}
