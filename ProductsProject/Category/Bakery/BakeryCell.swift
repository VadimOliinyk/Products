//
//  BakeryCell.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 06.12.2023.
//

import UIKit

class BakeryCell: UICollectionViewCell {
 
    static let reuseIdentifier = "BakeryCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel  = UILabel()
        nameLabel.font = UIFont(name: "Menlo", size: 15)
        nameLabel.textAlignment = .center
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.2
        
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupShadows()
        setupBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
    
    func configure(with bakery: Info) {
        imageView.image = bakery.image
        nameLabel.text  = bakery.name
    }
}
