//
//  ProductDB+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 02.09.2021.
//
//

import Foundation
import CoreData


extension ProductDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductDB> {
        return NSFetchRequest<ProductDB>(entityName: "ProductDB")
    }

    @NSManaged public var name: String?
    @NSManaged public var count: Int64

}

extension ProductDB : Identifiable {

}
