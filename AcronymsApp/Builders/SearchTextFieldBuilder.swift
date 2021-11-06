//
//  SearchBuilder.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 6/11/21.
//

import UIKit

protocol UISearchTextFieldBuilder: AnyObject {
    func placeHolder(_ placeHolder: String) -> Self
    func keyboardType(_ type: UIKeyboardType) -> Self
    func returnType(_ type: UIReturnKeyType) -> Self
}

class SearchTextFieldBuilder<T: UISearchTextField>: Builder, UISearchTextFieldBuilder, UIViewBuilder {
    
    internal var object: UISearchTextField!
    
    init(placeHolder: String) {
        object = UISearchTextField(frame: .zero)
        object.translatesAutoresizingMaskIntoConstraints = false
        object.placeholder = placeHolder
    }
    
    func build() -> UISearchTextField {
        return object
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        object.backgroundColor = color
        return self
    }
    
    @discardableResult
    func cornerRadius(_ corner: CGFloat) -> Self {
        object.layer.cornerRadius = corner
        object.clipsToBounds = true
        return self
    }
    
    @discardableResult
    func accessibilityIdentifier(_ identifier: String?) -> Self {
        object.accessibilityIdentifier = identifier
        return self
    }
    
    @discardableResult
    func placeHolder(_ placeHolder: String) -> Self {
        object.placeholder = placeHolder
        return self
    }
    
    @discardableResult
    func widthConstraint(_ constant: CGFloat) -> Self {
        object.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func heightConstraint(_ constant: CGFloat) -> Self {
        object.heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func keyboardType(_ type: UIKeyboardType) -> Self {
        object.keyboardType = type
        return self
    }
    
    @discardableResult
    func returnType(_ type: UIReturnKeyType) -> Self {
        object.returnKeyType = type
        return self
    }
}
