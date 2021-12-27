//
//  TrainningView1.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 22.08.2021.
//

import UIKit

class TrainingView1: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var trainingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trainingTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = indexPath.row.description
        return cell
    }
}
