//
//  secondViewController.swift
//  Lesson 4
//
//  Created by mono on 28.11.2020.
//
//2. На второй вкладке должна быть View и кнопка. По нажатию на кнопку должна запускаться цепочка анимаций (минимум 3 штуки), в конце которой View возвращается в исходную точку.

import UIKit

class secondViewController: UIViewController {

	
	@IBOutlet weak var squareView: UIView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func startAnimation(_ sender: Any) {
		let start = squareView.center
		UIView.animateKeyframes(
			withDuration: 1.2,
			delay: 0,
			options: .calculationModeLinear) {
			[self] in
			
			UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
				squareView.backgroundColor = .systemRed
			}
			UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
				squareView.center = CGPoint(x: start.x + 150, y: start.y)
			}
			UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
				squareView.center = CGPoint(x: start.x + 150, y: start.y + 150)
			}
			UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.6) {
				squareView.backgroundColor = .systemBlue
			}
			UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.3) {
				squareView.center = CGPoint(x: start.x, y: start.y + 150)
			}
			UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.3) {
				squareView.center = CGPoint(x: start.x, y: start.y)
			}
			
		}
	}
	
}
