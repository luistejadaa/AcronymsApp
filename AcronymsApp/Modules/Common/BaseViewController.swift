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
    weak var delegate: BaseViewControllerDelegate?
    var hasMenuButton: Bool = false
    var titleLabelTopConstraint: NSLayoutConstraint!
    let titleLabel: UILabel = {
        return CommonControls.generateTitleLabel()
    }()
    
    let subTitleLabel: UILabel = {
        return CommonControls.generateSubtitleLabel(textAligment: .left)
    }()
    
    convenience init(title: String?, hasMenuButton: Bool) {
        self.init()
        self.title = title
        self.hasMenuButton = hasMenuButton
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubviews(titleLabel, subTitleLabel)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
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
        if let delegate = self.delegate {
            delegate.keyboardWillAppear()
        }
    }
    
    @objc fileprivate func keyboardHide() {
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
        titleLabelTopConstraint = titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        NSLayoutConstraint.activate([
            titleLabelTopConstraint,
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            subTitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ])
    }
}
