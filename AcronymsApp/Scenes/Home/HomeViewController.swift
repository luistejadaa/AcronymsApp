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
    
    var data: [Acronyms]!
    
    private let searchTextField: UISearchTextField = {
        let textField = CommonControls.generateSearchTextField(placeholder: "Enter an Acromine")
        textField.autocapitalizationType = .allCharacters
        textField.autocorrectionType = .no
        return textField
    }()
    
    private var detailViewCloseButton: UIButton?
    private var detailViewTitleLabel: UILabel?
    private var detailViewSinceLabel: UILabel?
    private var detailViewFreqLabel: UILabel?
    
    private let resultCollectionView: UICollectionView = {
        let collectionView = CommonControls.generateCollectionView(cellClass: AcronymViewCell.self, identifier: "resultCell")
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.allowsMultipleSelection = false
        return collectionView
    }()
    
    let effectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.isHidden = true
        return effectView
    }()
    
    let detailView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerCurve = .continuous
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 3
        
        let closeButton = UIButton(type: .custom)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(named: "closeIcon")?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .normal)
        let titleLabel = CommonControls.generateTitleLabel()
        let sinceLabel = CommonControls.generateSubtitleLabel(textAligment: .right)
        let freqLabel = CommonControls.generateSubtitleLabel(textAligment: .right)
        
        view.addSubviews(closeButton, titleLabel, sinceLabel, freqLabel)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            closeButton.widthAnchor.constraint(equalToConstant: 32),
            closeButton.heightAnchor.constraint(equalToConstant: 32),
            
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            sinceLabel.bottomAnchor.constraint(equalTo: freqLabel.topAnchor, constant: -8),
            sinceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sinceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            freqLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            freqLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            freqLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        return view
    }()
    
    var presenter: HomePresenterProtocol!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        view.addSubviews(searchTextField, resultCollectionView, effectView, detailView)
        super.viewDidLoad()
        setTitle("Acronyms")
        setSubTitle("Search")
        
        searchTextField.delegate = self
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        if let layout = resultCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 20
            layout.minimumInteritemSpacing = 16
            layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            let squareSize = (resultCollectionView.frame.width - 40) / 2
            let size = CGSize(width: squareSize, height: squareSize)
            layout.itemSize = size
        }
        
        detailViewCloseButton = detailView.subviews[0] as? UIButton
        detailViewTitleLabel = detailView.subviews[1] as? UILabel
        detailViewSinceLabel = detailView.subviews[2] as? UILabel
        detailViewFreqLabel = detailView.subviews[3] as? UILabel
        if let closeButton = detailViewCloseButton {
            closeButton.addTarget(self, action: #selector(pushCloseDetail), for: .touchUpInside)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCollectionView))
        resultCollectionView.addGestureRecognizer(tapGesture)
        
        presenter.didLoad()
    }
    
    @objc func tapCollectionView() {
        view.endEditing(true)
    }
    
    @objc func pushCloseDetail() {
        if let indexPath = resultCollectionView.indexPathsForSelectedItems?.first, let cell = resultCollectionView.cellForItem(at: indexPath) {
            let rect = cell.convert(cell.bounds, to: self.view)
            self.detailViewTitleLabel?.isHidden = true
            self.detailViewSinceLabel?.isHidden = true
            self.detailViewFreqLabel?.isHidden = true
            resultCollectionView.deselectItem(at: indexPath, animated: false)
            UIView.animate(withDuration: 0.1) {
                self.detailView.frame = rect
            } completion: { _ in
                self.detailView.isHidden = true
                self.effectView.isHidden = true
                
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            presenter.search(acronyms: text)
        }
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            resultCollectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            resultCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resultCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            resultCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            effectView.topAnchor.constraint(equalTo: view.topAnchor),
            effectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            effectView.heightAnchor.constraint(equalTo: view.heightAnchor),
            effectView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        view.layoutIfNeeded()
    }
    
}

// MARK: - Extensions -

extension HomeViewController: HomeViewProtocol {
    func reload(data: [Acronyms]) {
        self.data = data
        resultCollectionView.reloadData()
    }
    
    func presentError(message: String) {
        self.presentAlert(with: "Error", message: message, actions: [UIAlertAction(title: "Continue", style: .default, handler: nil)], completion: nil)
    }
}

// MARK: - UISearchTextFieldDelegate -
extension HomeViewController: UISearchTextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count == 0 ? 0 : data[0].lfs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as? AcronymViewCell {
            cell.titleLabel.text = data[0].lfs[indexPath.row].lf
            return cell
        }
        return .init(frame: .zero)
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.endEditing(true)
        if let cell = collectionView.cellForItem(at: indexPath) {
            let rect = cell.convert(cell.bounds, to: self.view)
            detailView.frame = rect
            self.effectView.alpha = 0
            self.effectView.isHidden = false
            self.detailViewTitleLabel?.text = data[0].lfs[indexPath.row].lf
            self.detailViewSinceLabel?.text = "Since: \(data[0].lfs[indexPath.row].since)"
            self.detailViewFreqLabel?.text = "Occurrences of the definition : \(data[0].lfs[indexPath.row].freq)"
            self.detailView.isHidden = false
            self.detailViewTitleLabel?.isHidden = false
            self.detailViewSinceLabel?.isHidden = false
            self.detailViewFreqLabel?.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.effectView.alpha = 1
            }
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [.curveEaseIn], animations: {
                let squareSize = self.view.frame.width / 1.2
                self.detailView.frame.size = CGSize(width: squareSize, height: squareSize / 1.2)
                self.detailView.center = self.view.center
            })
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
