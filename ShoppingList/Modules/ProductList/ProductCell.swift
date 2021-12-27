//
//  CurrentListCell.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 22.08.2021.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    func fill(with product: Product) {
        nameLabel.text = product.name
        countLabel.text = product.count.description
    }
}
