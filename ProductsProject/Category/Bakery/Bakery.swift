//
//  Bakery.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 06.12.2023.
//

import UIKit

class Bakery: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate     = self
        collectionView.dataSource   = self
        collectionView.register(BakeryCell.self, forCellWithReuseIdentifier: BakeryCell.reuseIdentifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bakery"
        navigationController?.navigationBar.tintColor = .black
        setUpColectionView()
    }
    
    func setUpColectionView(){
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension Bakery: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CellAnimatable {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bakeryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BakeryCell.reuseIdentifier, for: indexPath) as! BakeryCell
        let bake = bakeryItems[indexPath.row]
        cell.configure(with: bake)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = bakeryItems[indexPath.item]
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

        if let cell = collectionView.cellForItem(at: indexPath) as? BakeryCell {
            UIView.animate(withDuration: 0.2) {
                cell.transform = CGAffineTransform(scaleX: scale, y: scale)
                self.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
            }
        }
    }
}
