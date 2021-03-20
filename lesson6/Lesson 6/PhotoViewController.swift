//
//  PhotoViewController.swift
//  Lesson 6
//
//  Created by mono on 05.12.2020.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
