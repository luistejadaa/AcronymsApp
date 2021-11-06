//
//  HomeWireframe.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeWireframe: BaseWireframe<HomeViewController> {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = HomeViewController()
        super.init(viewController: moduleViewController)

        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeInterface {
}
