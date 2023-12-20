//
//  DetailsViewControllerCells.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 08.12.2023.
//

import UIKit

class ProductAddVC: UIViewController {
    
    var selectedProduct: Info?
    static var productsInBasket: [Info] = []
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Menlo", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    @objc private let addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add to card", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor    = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font   = UIFont(name: "Menlo", size: 18)
        button.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure()
    }

    private func setupUI() {
        view.addSubview(productImageView)
        view.addSubview(addToCartButton)
        view.addSubview(nameLabel)
        view.backgroundColor = .white

    NSLayoutConstraint.activate([
        productImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
        productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        productImageView.widthAnchor.constraint(equalToConstant:  200),
        productImageView.heightAnchor.constraint(equalToConstant: 200),

    nameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
    nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        addToCartButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant:50),
        addToCartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        addToCartButton.widthAnchor.constraint(equalToConstant:  150),
        addToCartButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        setUpshadow(with: productImageView)
        setUpshadow(with: addToCartButton)
        setUpshadow(with: nameLabel)

    }
    
    @objc func addToCartButtonTapped() {
        if let selectedProduct = selectedProduct {
            ProductAddVC.productsInBasket.append(selectedProduct)
            print("Product added to cart: \(selectedProduct.name)")
            ShopButton().tableView.reloadData()
            showAlert()
        }
    }
    
    func setUpshadow(with view: UIView){
        view.layer.shadowColor      = UIColor.black.cgColor
        view.layer.shadowOffset     = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity    = 0.5
        view.layer.shadowRadius     = 2.0
    }   
    
    func configure(){
        if let product = selectedProduct {
            productImageView.image  = product.image
            nameLabel.text          = product.name
        }
    }

    func showAlert() {
        let alertController = UIAlertController(
            title: "Added",
            message: "Product was added to list",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                self.dismiss(animated: true)
                print("OK tapped")
            })
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}



