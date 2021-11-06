//
//  BaseViewController.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 5/11/21.
//

import UIKit

protocol BaseViewControllerDelegate: AnyObject {
    func keyboardWillAppear()
    func keyboardWillHide()
}

class BaseViewController: UIViewController {
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = CommonControls.generateActivityIndicatore(.large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .mainBlack
        return indicator
    }()
    
    weak var delegate: BaseViewControllerDelegate?
    
    private let titleLabel: UILabel = {
        return CommonControls.generateTitleLabel()
    }()
    
    private let subTitleLabel: UILabel = {
        return CommonControls.generateSubtitleLabel(textAligment: .left)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubviews(titleLabel, subTitleLabel, activityIndicator)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        setupConstraints()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            if hitView === self.view {
                hideKeyboard(in: self.view)
            }
        }
    }
    
    fileprivate func getSubControlsInView(view: UIView) -> [UIControl] {
        var controls = [UIControl]()
        
        for subview in view.subviews {
            controls += getSubControlsInView(view: subview)
            if subview is UIControl {
                controls.append(subview as? UIControl ?? UIControl())
            }
        }
        return controls
    }
    
    fileprivate func hideKeyboard(in view: UIView) {
        for control in getSubControlsInView(view: self.view) where control.isFirstResponder {
            control.resignFirstResponder()
        }
    }
    
    @objc fileprivate func keyboardShow() {
        view.backgroundColor = .lightGray
        if let delegate = self.delegate {
            delegate.keyboardWillAppear()
        }
    }
    
    @objc fileprivate func keyboardHide() {
        view.backgroundColor = .white
        if let delegate = self.delegate {
            delegate.keyboardWillHide()
        }
    }
    
    func executeButton(action : () -> Void) {
        hideKeyboard(in: self.view)
        action()
    }
    
    func presentAlert(with title: String?, message: String?, actions: [UIAlertAction], completion: (() -> Void )?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addActions(actions)
        present(alert, animated: true, completion: completion)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            subTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        additionalSafeAreaInsets.top = 56
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setSubTitle(_ title: String) {
        subTitleLabel.text = title
    }
}
