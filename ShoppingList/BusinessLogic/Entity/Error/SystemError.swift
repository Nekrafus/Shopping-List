//
//  SystemError.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 26.09.2021.
//

import Foundation

enum SystemError: LocalizedError {
    case `default`
    case emptyFields
    case wrongCount
    
    var errorDescription: String? {
        switch self {
        case .wrongCount:
            return "Неверное количество продуктов"
        case .emptyFields:
            return "Заполните все поля"
        case .default:
            return "Smth went wrong"
        }
    }
}
