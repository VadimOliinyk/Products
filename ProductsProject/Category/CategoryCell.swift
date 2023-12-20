//
//  CategoryCell.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 04.12.2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CategoryCell"

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
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
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupShadows() {
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -2, height: 5)
        layer.shadowRadius = 2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }

    private func setupBackgroundColor() {
        backgroundColor = #colorLiteral(red: 0.7686918974, green: 0.9630072713, blue: 1, alpha: 1)
    }

    func configure(with food: Info) {
        nameLabel.text  = food.name
        imageView.image = food.image
    }
}

