//
//  LabelBuilder.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//

import Foundation

import UIKit.UILabel

protocol UILabelBuilder: AnyObject {
    func attributedText(_ attributedText: NSAttributedString) -> Self
    func textColor(_ color: UIColor) -> Self
    func font(_ font: UIFont) -> Self
    func text(_ text: String) -> Self
    func numberOfLines(_ numberOfLines: Int) -> Self
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self
}

class LabelBuilder<T: UILabel>: Builder, UILabelBuilder, UIViewBuilder {
    internal var object: UILabel!
    
    init(frame: CGRect?) {
        object = UILabel(frame: .zero)
        object.translatesAutoresizingMaskIntoConstraints = false
        object.numberOfLines = 0
    }
    
    @discardableResult
    func build() -> UILabel {
        return object
    }
    
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        object.attributedText = attributedText
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        object.textColor = color
        return self
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        object.font = font
        return self
    }
    
    @discardableResult
    func text(_ text: String) -> Self {
        object.text = text
        return self
    }
    
    @discardableResult
    func numberOfLines(_ numberOfLines: Int) -> Self {
        object.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        object.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    func translatesAutoresizingMaskIntoConstraints(_ status: Bool) -> Self {
        object.translatesAutoresizingMaskIntoConstraints = status
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
    func accessibilityIdentifier(_ identifier: String) -> Self {
        object.accessibilityIdentifier = identifier
        return self
    }
    
}
