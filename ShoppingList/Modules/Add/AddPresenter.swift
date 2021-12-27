//
//  AddPresenter.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 16.09.2021.
//

import Foundation

class AddPresenter: AddViewOutput {
    weak var view: AddViewInput!
    var service: ProductServiceProtocol = ProductService.shared
   
    init(view: AddViewInput) {
        self.view = view
    }
   
    func add(product: Product) {
        do {
            try product.validate()
            try service.save(product)
            view.setupInitialState()
        } catch {
            view.show(error)
        }
    }
    
}
