//
//  ButtonBuilder.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//

import UIKit.UIButton

protocol UIButtonBuilder: AnyObject {
    func title(_ title: String, for state: UIControl.State) -> Self
    func titleColor(_ color: UIColor, for state: UIControl.State) -> Self
    func attributedTitle(_ attributedTitle: NSAttributedString, for state: UIControl.State) -> Self
}

class ButtonBuilder<T: UIButton>: Builder, UIButtonBuilder, UIViewBuilder {
    internal var object: UIButton!
    
    init(type: UIButton.ButtonType) {
        object = UIButton(type: type)
        object.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func build() -> UIButton {
        return  object
    }

    @discardableResult
    func title(_ title: String, for state: UIControl.State) -> Self {
        object.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    func titleColor(_ color: UIColor, for state: UIControl.State) -> Self {
        object.setTitleColor(color, for: state)
        return self
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
    func attributedTitle(_ attributedTitle: NSAttributedString, for state: UIControl.State) -> Self {
        object.setAttributedTitle(attributedTitle, for: state)
        return self
    }
    
    @discardableResult
    func accessibilityIdentifier(_ identifier: String?) -> Self {
        object.accessibilityIdentifier = identifier
        return self
    }
}
