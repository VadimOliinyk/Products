//
//  SetUps.swift
//  CollectionViewProject
//
//  Created by Vadym Oliinyk on 03.12.2023.
//

import UIKit

class SetUps {
    
    func labelSetUp(label: UILabel) {
        
        label.textColor = .white
        label.text = "Weclome to Market"
        label.font = UIFont(name: "Menlo", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func buttonSetUp(button: UIButton, target: Any?, action: Selector) {
        // MARK: Main SetUp
        button.backgroundColor = #colorLiteral(red: 0.7535622716, green: 0.4669147134, blue: 0.6580062509, alpha: 1)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont(name: "Menlo", size: 20)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 70
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(target, action: action, for: .touchUpInside)

    }
    
    func applyShadow(to view: UIView) {
        view.layer.shadowColor   = UIColor.black.cgColor
        view.layer.shadowOffset  = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius  = 4.0
    }
}
protocol CellAnimatable: class {
    func animateCellSelection(at indexPath: IndexPath, isHighlighted: Bool)
}

