//
//  TrainingView2.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 22.08.2021.
//

import UIKit

class TrainingView2: UIViewController, UITableViewDataSource {

    @IBOutlet weak var trainingTableView: UITableView!
    let dataSource: TrainingView2DataSource = TrainingView2DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trainingTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.getNames().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "trainigCell") as? TrainingTableViewCell else {
            return UITableViewCell()
        }
        
        let mynames = dataSource.getNames()
        cell.nameLabel.text = mynames[indexPath.row]
        return cell
    }
    
}
