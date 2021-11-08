//
//  AcronymsService.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 6/11/21.
//

import Foundation
import Moya

protocol AcronymsServiceProtocol: BaseServiceProtocol where Target == AcronymsTarget {
    func getDescriptionFor(acronyms: String, completion: @escaping (Result<[Acronyms], Error>) -> Void)
}

final class AcronymsService: AcronymsServiceProtocol {
    var provider: MoyaProvider<AcronymsTarget>
    static let shared: AcronymsService = {
        let instance = AcronymsService()
        return instance
    }()
    
    private init() {
        provider = MoyaProvider<AcronymsTarget>(plugins: [NetworkLoggerPlugin()])
    }
}

final class AcronymsServiceTest: AcronymsServiceProtocol {
    var provider: MoyaProvider<AcronymsTarget>
    static let shared: AcronymsServiceTest = {
        let instance = AcronymsServiceTest()
        return instance
    }()
    
    private init() {
        provider = MoyaProvider<AcronymsTarget>(stubClosure: MoyaProvider.immediatelyStub)
    }
}

extension AcronymsServiceProtocol {
    func getDescriptionFor(acronyms: String, completion: @escaping (Result<[Acronyms], Error>) -> Void) {
        provider.request(.getDescriptions(acronyms: acronyms), completion: { result in
            switch result {
            case .success(let response):
                do {
                    let result = try JSONDecoder().decode([Acronyms].self, from: response.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
