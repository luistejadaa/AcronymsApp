//
//  CommonControls.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//

import UIKit

/// This class is a helper to generate controls that are repeated throughout the project with the same properties
final class CommonControls {
    
    /// Called for generate a button with the main style
    /// - Parameters:
    ///   - color: color for the background
    ///   - title: the text for the button label
    ///   - titleColor: the color for the label title
    /// - Returns: UIButton
    static func generateButton(withBackgroundColor color: UIColor, title: String, titleColor: UIColor, accessibilityIdentifier: String? = nil) -> UIButton {
        ButtonBuilder(type: .system)
            .backgroundColor(color)
            .cornerRadius(6)
            .accessibilityIdentifier(accessibilityIdentifier)
            .attributedTitle(NSMutableAttributedString(string: title, attributes:
                                                        [
                                                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                                            NSAttributedString.Key.foregroundColor: titleColor
                                                        ]), for: .normal)
            .build()
    }
    
    /// Called for the  generate a button without  background  color
    /// - Parameters:
    ///   - title: the text for the buttono label
    ///   - titleColor: the color for the label title
    /// - Returns: UIButton
    static func generateButton(for title: String, titleColor: UIColor, accessibilityIdentifier: String? = nil) -> UIButton {
        ButtonBuilder(type: .system)
            .titleColor(.mainBlack, for: .normal)
            .accessibilityIdentifier(accessibilityIdentifier)
            .attributedTitle(NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]), for: .normal)
            .build()
    }
    
    /// Called for the  generate a label with a bold font size 30
    /// - Parameter:  the text for thee label
    /// - Returns: UILabel
    static func generateTitleLabel(with text: String = String.empty) -> UILabel {
        LabelBuilder(frame: .zero)
            .text(text)
            .textColor(.mainBlack)
            .font(UIFont.boldSystemFont(ofSize: 32))
            .build()
    }
    
    /// Called for the  generate a bold label with a font size 20
    /// - Parameter:  the text for thee label
    /// - Returns: UILabel
    static func generateSubtitleLabel(with text: String = String.empty, textAligment: NSTextAlignment) -> UILabel {
        LabelBuilder(frame: .zero)
            .text(text)
            .textColor(.label)
            .font(UIFont.boldSystemFont(ofSize: 20))
            .textAlignment(textAligment)
            .build()
    }
    
    /// Called for the  generate a label with a font size 16
    /// - Parameter:  the text for thee label
    /// - Returns: UILabel
    static func generateInfoLabel(with text: String) -> UILabel {
        LabelBuilder(frame: .zero)
            .text(text)
            .textColor(.label)
            .font(UIFont.systemFont(ofSize: 16))
            .build()
    }
    
    /// Called for generate an UIImageView
    /// - Parameters:
    ///   - image: the image that the image view contains
    ///   - contentMode: the content mode
    /// - Returns: UIButton
    static func generateImageView(with image: UIImage?, contentMode: UIView.ContentMode) -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.contentMode = contentMode
        return imageView
    }
    
    /// Called for generate an UITableView
    /// - Parameters:
    ///   - style: the style for the table view
    ///   - cellClass: the cell type for register
    ///   - identifier: identifier for reusable cell
    /// - Returns: UIButton
    static func generateCollectionView(cellClass: AnyClass, identifier: String) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(cellClass, forCellWithReuseIdentifier: identifier)
        return collectionView
    }
    
    /// Called for generate an UIActivityIndicatorView
    /// - Parameters:
    ///   - style: the style for the activity
    /// - Returns: UIActivityIndicatorView
    static func generateActivityIndicatore(_ style: UIActivityIndicatorView.Style) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .mainBlack
        return indicator
    }
    
    /// Called for generate an UISearchTextField
    /// - Parameters:
    ///   - placeholder: the placeholder for the search text field
    /// - Returns: UISearchTextField
    static func generateSearchTextField(placeholder: String) -> UISearchTextField {
        let searchTextField = SearchTextFieldBuilder(placeHolder: placeholder)
            .heightConstraint(40)
            .keyboardType(.default)
            .returnType(.done)
            .build()
        return searchTextField
    }
}
