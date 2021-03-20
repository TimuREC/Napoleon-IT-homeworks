//
//  CollectionViewCell.swift
//  Lesson 5
//
//  Created by mono on 29.11.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(index: Int) {
        cellLabel.text = "\(index)"
    }

}
