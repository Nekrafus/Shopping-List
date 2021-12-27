//
//  AddViewIO.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 23.09.2021.
//

import Foundation

protocol AddViewInput: AnyObject, UIViewInput {
    func setupInitialState()
}

protocol AddViewOutput {
    func add(product: Product)
}
