//
//  EditPresenter.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 12.09.2021.
//

import Foundation

class EditPresenter: EditViewOutput {
    weak var view: EditViewInput!
    var service: ProductServiceProtocol = ProductService.shared
    
    var product: Product?
    var productIndex: Int?

    init(view: EditViewInput) {
        self.view = view
    }
    
    func edit(product: Product, productIndex: Int) {
        do {
            try product.validate()
            try service.editData(product: product, index: productIndex)
            view.back()
        } catch {
            view.show(error)
        }
    }
}
