//
//  ShopButton.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 09.12.2023.
//

import UIKit

class ShopButton: UIViewController {
    
    var products: [Info] = []
    
    lazy var tableView: UITableView = {
        let layout = UITableView()
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        navigationController?.navigationBar.tintColor = .black
        title = "Basket"
        setupCollectionView()
        updateCartUI()
    }

    func updateCartUI() {
        tableView.reloadData()
    }
    
    private func setupCollectionView() {
        view.addSubview(tableView)
        
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(ShopCell.self, forCellReuseIdentifier: ShopCell.reuseIdentifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ShopButton: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductAddVC.productsInBasket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopCell.reuseIdentifier, for: indexPath) as! ShopCell
        let cartItem = ProductAddVC.productsInBasket[indexPath.row]
        cell.configure(with: cartItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeDelete = UIContextualAction(style: .destructive, title: "remove") { ( action, view, completion) in
            ProductAddVC.productsInBasket.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        swipeDelete.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [swipeDelete])
    }
}
