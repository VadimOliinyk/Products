//
//  AlchoholsCell.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 05.12.2023.
//

import UIKit

class AlchoholsCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AlchoholsCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode  = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label  = UILabel()
        label.font = UIFont(name: "Menlo", size: 15)
        label.textAlignment       = .center
        label.minimumScaleFactor  = 0.2
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupShadows()
        setupBackgroundColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        setupShadows()
        setupBackgroundColor()
    }
    
    private func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupShadows() {
        layer.cornerRadius  = 8
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset  = CGSize(width: 0, height: 2)
        layer.shadowRadius  = 4
    }
    
    private func setupBackgroundColor() {
        backgroundColor = UIColor.white
    }
    
    func configure(with alchohols: Info) {
        imageView.image = alchohols.image
        nameLabel.text  = alchohols.name
    }
}
