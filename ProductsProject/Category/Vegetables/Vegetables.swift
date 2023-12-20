//
//  Vegetables.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 05.12.2023.
//

import UIKit

class Vegetables: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        title = "Vegetables"
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(VegetablesCell.self, forCellWithReuseIdentifier: VegetablesCell.reuseIdentifier)
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension Vegetables: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CellAnimatable {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vegetables.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VegetablesCell.reuseIdentifier, for: indexPath) as! VegetablesCell
        let vegetable = vegetables[indexPath.row]
        cell.configure(with: vegetable)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = vegetables[indexPath.item]
        showProductDetail(for: selectedProduct)
    }

    func showProductDetail(for product: Info) {
        let productDetailVC = ProductAddVC()
        productDetailVC.selectedProduct = product
        navigationController?.present(productDetailVC, animated: true)
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
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        animateCellSelection(at: indexPath, isHighlighted: true)
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        animateCellSelection(at: indexPath, isHighlighted: false)

    }
    func animateCellSelection(at indexPath: IndexPath, isHighlighted: Bool) {
        let scale: CGFloat = isHighlighted ? 1.2 : 1.0
        
        if let cell = collectionView.cellForItem(at: indexPath) as? VegetablesCell {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: scale, y: scale)
                self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
            }
        }
    }
}
