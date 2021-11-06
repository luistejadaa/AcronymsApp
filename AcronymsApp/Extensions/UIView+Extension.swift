//
//  UIView+Extension.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
