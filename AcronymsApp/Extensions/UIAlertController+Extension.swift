//
//  UIAlertController+Extension.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//

import Foundation

import UIKit.UIAlertController

extension UIAlertController {
    func addActions(_ actions: [UIAlertAction]) {
        for action in actions {
            addAction(action)
        }
    }
}
