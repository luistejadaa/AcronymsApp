//
//  HomeInteractor.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class HomeInteractor {
    var presenter: BasePresenterProtocol?
    let acronymsService = AcronymsService.shared
}

// MARK: - Extensions -

extension HomeInteractor: HomeInteractorProtocol {
    func request(acronyms: String) {
        acronymsService.getDescriptionFor(acronyms: acronyms) { result in
            switch result {
            case .success(let response):
                if let presenter = self.presenter as? HomePresenterProtocol {
                    presenter.didReceived(data: response)
                }
            case .failure(let error):
                if let presenter = self.presenter as? HomePresenterProtocol {
                    presenter.didReceived(error: error)
                }
            }
        }
    }
}
