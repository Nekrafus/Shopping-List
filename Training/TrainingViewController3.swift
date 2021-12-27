//
//  TrainingViewController3.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 22.08.2021.
//

import UIKit



class TrainingViewController3: UIViewController, UITableViewDataSource {

    @IBOutlet weak var training3TableView: UITableView!
    
    var students: [Student] = [ Student(name: "Nikita", surname: "Veretenov", score: 30),
                                Student(name: "Artem", surname: "Konovalov", score: 45),
                                Student(name: "Vova", surname: "qwer", score: 60)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        training3TableView.dataSource = self
        
//        training3TableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = training3TableView.dequeueReusableCell(withIdentifier: "scoreCell") as? TrainingViewController3Cell else {
            return UITableViewCell()
        }
        let student = students[indexPath.row]
        cell.fill(with: student)
        return cell
    }
}
