//
//  EditViewIO.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 23.09.2021.
//

import Foundation

import Foundation

protocol EditViewInput: AnyObject, UIViewInput {
    func back()
}

protocol EditViewOutput {
    func edit(product: Product, productIndex: Int)
}
