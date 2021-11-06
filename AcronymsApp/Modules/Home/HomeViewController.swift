//
//  HomeViewController.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - Public properties -

    var presenter: HomePresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Acronyms"
    }

}

// MARK: - Extensions -

extension HomeViewController: HomeViewInterface {
}