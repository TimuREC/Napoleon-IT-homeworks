//
//  ViewController.swift
//  Lesson 3.1
//
//  Created by mono on 18.11.2020.
//

import UIKit

@IBDesignable
class PrimaryButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
            
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
                layer.borderColor = newValue?.cgColor
        }
    }
}

class ViewController: UIViewController {

//    @IBOutlet weak var movingView: UIView!
    @IBOutlet weak var topRectConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goRectDown(_ sender: PrimaryButton) {
        topRectConstraint?.constant = (topRectConstraint?.constant ?? 0) + 150
        sender.isEnabled = false
        sender.backgroundColor = .gray
    }

}

