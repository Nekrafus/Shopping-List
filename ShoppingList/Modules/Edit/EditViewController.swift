//
//  EditViewController.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 26.08.2021.
//

import UIKit

class EditViewController: UIViewController, EditViewInput {
    
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var productCountStepper: UIStepper!
    
    var product: Product?
    var productIndex: Int = 0
    
    var output: EditViewOutput!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        output = EditPresenter(view: self)
        setupInitialState()
    }
    
    func setupInitialState() {
        productNameTextField.text = product?.name
        productCountLabel.text = product?.count.description
        
        let count = product?.count ?? 0
        productCountStepper.value = Double(count)
    }
    
    @IBAction func changeProductCount(_ sender: Any) {
        let productCount = Int(productCountStepper.value)
        productCountLabel.text = productCount.description
    }
    
    @IBAction func completeEdit(_ sender: Any) {
        let product = prepareProduct()
        output.edit(product: product, productIndex: productIndex)
    }
    
    func back() {
        navigationController?.popViewController(animated: true)
    }
    
    func prepareProduct() -> Product {
        let name = productNameTextField.text ?? ""
        let count = Int(productCountStepper.value)
        let product = Product(name: name, count: count)
        return product
    }
}
