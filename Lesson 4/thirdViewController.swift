//
//  thirdViewController.swift
//  Lesson 4
//
//  Created by mono on 28.11.2020.
//

//3. На третьей вкладке должно быть 3 View.

import UIKit

class thirdViewController: UIViewController {

	@IBOutlet weak var frontView: UIView!
	@IBOutlet weak var firstView: UIView!
	@IBOutlet weak var secondView: UIView!
	@IBOutlet weak var thirdView: UIView!
	
	@IBOutlet weak var botConstraint: NSLayoutConstraint!
	private var isFlipped: Bool = false
	private var isUpped: Bool = false
	
	private lazy var touchFirstGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(animateTransitions(_:)))
	private lazy var touchSecondGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeColor(_:)))
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		makeActive(frontView, touchFirstGesture)
//		makeActive(thirdView, touchFirstGesture)
		makeActive(secondView, touchSecondGesture)
    }
	
	func makeActive(_ view: UIView, _ action: UITapGestureRecognizer) {
		view.addGestureRecognizer(action)
		view.isUserInteractionEnabled = true
	}
	
	@objc func changeColor(_ sender: UITapGestureRecognizer) {
//		Вторая, по нажатию на нее, должна анимированно менять цвет и какой-нибудь констрэинт относительно края экрана (можно рандомно менять оба параметра, чтобы можно было нажимать несколько раз).
		switch sender.state {
		case .ended:
			UIView.animate(withDuration: 1) {
				switch Int.random(in: (0...3)) {
				case 0:
					self.secondView.backgroundColor = .systemPurple
				case 1:
					self.secondView.backgroundColor = .systemRed
				case 2:
					self.secondView.backgroundColor = .systemGray
				case 3:
					self.secondView.backgroundColor = .systemGreen
				default:
					break
				}
				self.botConstraint.constant = self.isUpped ? self.botConstraint.constant - 100 : self.botConstraint.constant + 100
				self.isUpped.toggle()
//				if self.secondView.leadingAnchor == self.firstView.leadingAnchor {
//					self.secondView.leadingAnchor.constraint(equalTo: self.thirdView.leadingAnchor).isActive = true
//				} else {
//					self.secondView.leadingAnchor.constraint(equalTo: self.firstView.leadingAnchor).isActive = true
//				}
//				self.secondView.layoutIfNeeded()
			}
		default:
			break
		}
	}
	
	@objc func animateTransitions(_ sender: UITapGestureRecognizer) {
//		По нажатию на первую с ней должна выполняться какая-либо анимация с использованием UIView.transition(from:..., to:...) (в качестве параметра to надо использовать одну из добавленных View).
		switch sender.state {
		case .ended:
			UIView.transition(
				from: isFlipped ? thirdView : firstView,
				to: isFlipped ? firstView : thirdView,
				duration: 1,
				options: [.transitionFlipFromLeft, .showHideTransitionViews],
				completion:  { _ in
					self.isFlipped.toggle()
				}
			)
		default:
			break
		}
	}
	

}
