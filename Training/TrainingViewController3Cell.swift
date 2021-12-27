//
//  TrainingViewController3Cell.swift
//  ShoppingList
//
//  Created by Vladimir Pulkhrov on 22.08.2021.
//

import UIKit

class TrainingViewController3Cell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    func fill(with student: Student) {
        let surname = student.surname
        let name = student.name
        nameLabel.text = name + " " + surname
        scoreLabel.text = student.score.description
    }
}
