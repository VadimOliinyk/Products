//
//  ViewController.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 03.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let setUp   = SetUps()
    let label   = UILabel()
    let button  = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3161935806, green: 0.4653068185, blue: 0.505287528, alpha: 1)
        
        setUp.buttonSetUp(button: button, target: self, action: #selector(ButtonTapped))
        setUp.applyShadow(to: button)
        
        setUp.labelSetUp(label: label)
        setUp.applyShadow(to: label)
        
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 140),
            button.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    @objc func ButtonTapped(){
        let categoryVC = categoryViewController()
        navigationController?.pushViewController(categoryVC, animated: true)
    }
}

