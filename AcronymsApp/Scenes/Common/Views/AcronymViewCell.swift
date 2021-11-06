//
//  AcronymViewCellCollectionViewCell.swift
//  AcronymsApp
//
//  Created by Luis Tejada on 6/11/21.
//

import UIKit

class AcronymViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = CommonControls.generateSubtitleLabel(textAligment: .left)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerCurve = .continuous
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 3
        backgroundColor = .white
        
        addSubviews(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
