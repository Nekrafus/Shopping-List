//
//  ProductCellStruct.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 26.08.2021.
//

import Foundation

struct Product {
    var name: String
    var count: Int
    
    func validate() throws {
        if count <= 0 {
            throw SystemError.wrongCount
        }
        if name.isEmpty {
            throw SystemError.emptyFields
        }
    }
}
