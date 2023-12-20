//
//  categoryViewController.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 04.12.2023.
//

import UIKit

class categoryViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        navigationItem.hidesBackButton = true
        title = "Categories"
        setupCollectionView()
        setUpBarButtonItem()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier:
                                CategoryCell.reuseIdentifier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setUpBarButtonItem() {
        
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let basketButton    = UIButton(type: .system)
        basketButton.frame  = CGRect(x: 0, y: 0, width: 30, height: 30)
        basketButton.setImage(UIImage(named: "BasketButton"), for: .normal)
        customView.addSubview(basketButton)
        basketButton.addTarget(self, action: #selector(shopButtonTapped), for: .touchUpInside)
        customView.tintColor = .black
        let customBarButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.rightBarButtonItem = customBarButtonItem
    }
    
    @objc func shopButtonTapped() {
        let shopVC = ShopButton()
        navigationController?.pushViewController(shopVC, animated: true)
    }
}

extension categoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as! CategoryCell
        let category = categories[indexPath.row]
        cell.configure(with: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCategory = categories[indexPath.row].name
        var selectedViewController: UIViewController?
        
        switch selectedCategory {
        case "Fruits":
            selectedViewController = Fruits()
        case "Vegetables":
            selectedViewController = Vegetables()
        case "Alchohol":
            selectedViewController = Alchohols()
        case "Bakery":
            selectedViewController = Bakery()
        case "FastFood":
            selectedViewController = FastFood()
        default:
            break
        }
        if let vc = selectedViewController{
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
}
