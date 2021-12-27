//
//  ShoppingListPresenter.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 14.09.2021.
//

import Foundation

class ProductListPresenter: ProductListViewOutput {
    
    weak var view: ProductListViewInput!
    var service: ProductServiceProtocol = ProductService.shared
    
    var products: [Product] {
        return service.products
    }
    
    init(view: ProductListViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func viewWillAppear() {
        if products.isEmpty {
            view.switchState(to: .emptyList)
        } else {
            view.switchState(to: .default)
        }
    }
    
    func prepareDataForSending() -> String {
        let products = service.products
        var shoppingList: String = ""
        for index in 0..<products.count {
            let product = products[index]
            shoppingList = shoppingList + "\(product.name) - \(product.count) \n"
        }
        return shoppingList
    }
    
    func deleteList() {
        do {
            try service.deleteList()
            view.switchState(to: .emptyList)
            view.updateTable()
        }
        catch {
            view.show(error)
        }
    }
    
}
