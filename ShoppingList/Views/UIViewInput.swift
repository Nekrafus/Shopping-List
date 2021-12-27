//
//  UIViewInput.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 23.09.2021.
//

import UIKit

protocol UIViewInput {
    func show(_ error: Error)
    func show(title: String, message: String)
}

extension UIViewInput {
    func show(title: String, message: String) {
        guard let self = self as? UIViewController else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func show(_ error: Error) {
        show(title: "Error", message: error.localizedDescription)
    }

}
