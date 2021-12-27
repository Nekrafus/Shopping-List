//
//  ProductListViewIO.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 21.09.2021.
//

import Foundation

protocol ProductListViewInput: AnyObject, UIViewInput {
    func switchState(to state: ProductListViewController.ViewState)
    func updateTable()
    func setupInitialState()
}

protocol ProductListViewOutput {
    var products: [Product] { get }
    func viewIsReady()
    func viewWillAppear()
    func prepareDataForSending() -> String
    func deleteList()
}
