//
//  ViewController.swift
//  Lesson 3.2
//
//  Created by mono on 18.11.2020.
//

//Создать экран. Программно добавить туда Label в верхнюю половину экрана и View на 40pt ниже, чем Label. Наложить на View UIPanGestureRecognizer. Если двигать по View пальцем снизу вверх - число на Label увеличивается, сверху вниз - уменьшается. Label и View должны быть центрированы по оси Х.

import UIKit

class ViewController: UIViewController {

    let counter = UILabel()
    var num = 0
    let actionView = UIView()
    private lazy var slideGesture: UIPanGestureRecognizer = UIPanGestureRecognizer(
        target: self,
        action: #selector(slideToChange(_:))
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addCounter()
        addActionView()
    }
    
    func addCounter() {
        counter.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(counter)
        counter.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        counter.text = String(num)
        counter.font = UIFont.boldSystemFont(ofSize: 40)
        counter.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        counter.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func addActionView() {
        actionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(actionView)
        actionView.backgroundColor = .cyan
        actionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4).isActive = true
        actionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        actionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        actionView.topAnchor.constraint(equalTo: counter.bottomAnchor, constant: 40).isActive = true
        actionView.addGestureRecognizer(slideGesture)
        actionView.isUserInteractionEnabled = true
    }

    @objc func slideToChange(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .changed:
            if actionView.frame.contains(sender.location(in: self.view)) {
                num = num - Int(sender.translation(in: actionView).y)
                counter.text = String(num)
            }
        default:
            break
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
}

