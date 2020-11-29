//
//  TableViewCell.swift
//  Lesson 5
//
//  Created by mono on 29.11.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    
    func setup(index: Int) {
        cellLabel.text! = "Text \(index)"
    }

}
