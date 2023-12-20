//
//  ShopCell.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 09.12.2023.
//

import UIKit

class ShopCell: UITableViewCell {
    
    var onSwipe: (() -> Void)?
    static let reuseIdentifier = "ShopCell"

    let ProductImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Menlo", size: 15)
        label.minimumScaleFactor = 0.2
        label.textAlignment = .center
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        addSubview(ProductImageView)
        addSubview(nameLabel)

        ProductImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints        = false

        NSLayoutConstraint.activate([
            ProductImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ProductImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            ProductImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            ProductImageView.widthAnchor.constraint(equalToConstant: 50),

            nameLabel.leadingAnchor.constraint(equalTo: ProductImageView.trailingAnchor,constant: 32),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
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
        backgroundColor = .white
    }

    func configure(with product: Info) {
        nameLabel.text  = product.name
        ProductImageView.image = product.image
    }
}
