//
//  UIViewBuilder.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//

import UIKit.UIView

protocol UIViewBuilder: AnyObject {
    func translatesAutoresizingMaskIntoConstraints(_ status: Bool) -> Self
    func tintColor(_ color: UIColor) -> Self
    func frame(_ frame: CGRect) -> Self
    func backgroundColor(_ color: UIColor) -> Self
    func cornerRadius(_ corner: CGFloat) -> Self
    func widthConstraint(_ constant: CGFloat) -> Self
    func heightConstraint(_ constant: CGFloat) -> Self
    func accessibilityIdentifier(_ identifier: String?) -> Self
}

extension UIViewBuilder {
    func translatesAutoresizingMaskIntoConstraints(_ status: Bool) -> Self {
        return self
    }
    
    func tintColor(_ color: UIColor) -> Self {
        return self
    }
    
    func frame(_ frame: CGRect) -> Self {
        return self
    }
    
    func backgroundColor(_ color: UIColor) -> Self {
        return self
    }
    func cornerRadius(_ corner: CGFloat) -> Self {
        return self
    }
    
    func widthConstraint(_ constant: CGFloat) -> Self {
        return self
    }
    func heightConstraint(_ constant: CGFloat) -> Self {
        return self
    }
    
    func accessibilityIdentifier(_ identifier: String?) -> Self {
        return  self
    }
}
