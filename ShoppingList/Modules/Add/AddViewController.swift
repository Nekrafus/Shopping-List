//
//  AddViewController.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 26.08.2021.
//

import UIKit

class AddViewController: UIViewController, AddViewInput {
    
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productCountStepper: UIStepper!
    
    var output: AddViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = AddPresenter(view: self)
        setupInitialState()
    }
    
    func setupInitialState() {
        productCountStepper.value = 0
        let stepperValue = Int(productCountStepper.value)
        productCountLabel.text = stepperValue.description
        productNameTextField.text = ""
    }
    
    @IBAction func changeProductCount(_ sender: UIStepper) {
        let count = Int(productCountStepper.value)
        productCountLabel.text = count.description
    }

    @IBAction func addProduct(_ sender: Any) {
        let product = prepareProduct()
        output.add(product: product)
    }
    
    func prepareProduct() -> Product {
        let count = Int(productCountStepper.value)
        let name = productNameTextField.text ?? ""
        let product = Product(name: name, count: count)
        return product
    }
    
    func showAddedAlert() {
        let alert = UIAlertController (title: "Продукт был добавлен", message: nil, preferredStyle: .alert)
        let addMore = UIAlertAction(title: "add more", style: .default, handler: nil)
        let toMain = UIAlertAction(title: "go to main", style: .default, handler: nil)
        alert.addAction(addMore)
        alert.addAction(toMain)
        present(alert, animated: true, completion: nil)
    }

}
