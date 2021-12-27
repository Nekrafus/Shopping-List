//
//  ShoppingListData.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 05.09.2021.
//


import UIKit

protocol ProductServiceProtocol {
    var products: [Product] { get }
    
    func save(_ product: Product) throws
    func deleteList() throws
    func fetch() -> [ProductDB]
    func editData(product: Product, index: Int) throws
}

class ProductService: ProductServiceProtocol {

    private var productsDB: [ProductDB] = []
    var products: [Product] = []
    
    static var shared: ProductService = ProductService()
    
    private init() {
        self.productsDB = fetch()
        self.products = mapToProducts(productsDB)
    }
    
    func fetch() -> [ProductDB] {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        guard let productsDB = try? context?.fetch(ProductDB.fetchRequest()) as? [ProductDB] else {
            return []
        }
        return productsDB
    }
    
    func mapToProducts(_ dbProducts: [ProductDB]) -> [Product] {
        var tmpProducts: [Product] = []
        for index in 0..<dbProducts.count {
            let count: Int = Int(dbProducts[index].count)
            let name: String = dbProducts[index].name ?? "n/a"
            let product = Product(name: name, count: count)
            tmpProducts.append(product)
        }
        return tmpProducts
    }
    
    func save(_ product: Product) throws {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        guard let storage = context else {
            throw SystemError.default
        }
        
        let productData = ProductDB(context: storage)
        productData.count = Int64(product.count)
        productData.name = product.name
        
        products.append(product)
        
        try storage.save()
    }
   
    func editData(product: Product, index: Int) throws {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        guard let storage = context else {
            throw SystemError.default
        }
        
        productsDB[index].count = Int64(product.count)
        productsDB[index].name = product.name
        
        products[index].count = product.count
        products[index].name = product.name
        
        try storage.save()
    }
    
    func deleteList() throws {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        guard let storage = context else {
            throw SystemError.default
        }
        
        for index in 0..<productsDB.count {
            storage.delete(productsDB[index])
        }
        products.removeAll()
        try storage.save()
    }

}
