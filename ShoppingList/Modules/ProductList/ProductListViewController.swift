//
//  ViewController.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 20.08.2021.
//

import UIKit

class ProductListViewController: UIViewController, ProductListViewInput {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var deleteBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var firstAddButton: UIButton!
        
    var selectedCellIndex: Int?
    var output: ProductListViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = ProductListPresenter(view: self)
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    func setupInitialState() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func updateTable() {
        tableView.reloadData()
    }
    
    @IBAction func send(_ sender: Any) {
        let list = output.prepareDataForSending()
        let vc = UIActivityViewController(activityItems: [list], applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editViewController = segue.destination as? EditViewController, let index = selectedCellIndex {
            editViewController.product = output.products[index]
            editViewController.productIndex = index
        }
    }
    
    @IBAction func deleteList(_ sender: Any) {
        output.deleteList()
    }
    
    func switchState(to state: ViewState) {
        tableView.isHidden = state == .emptyList
        deleteBarButtonItem.isEnabled = state != .emptyList
        sendButton.isHidden = state == .emptyList
        firstAddButton.isHidden = state != .emptyList
    }
    
}

extension ProductListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ProductCell else {
            return UITableViewCell()
        }
        let products = output.products
        let product = products[indexPath.row]
        cell.fill(with: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndex = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: nil)
    }
}

extension ProductListViewController {
    enum ViewState {
        case emptyList
        case `default`
    }
}


// покрыть протоколами
// прочитать документацию 
