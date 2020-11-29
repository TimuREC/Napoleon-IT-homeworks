//
//  ViewController.swift
//  Lesson 4
//
//  Created by mono on 28.11.2020.
//

//Реализовать TabBar с 3 вкладками:
//1. На первой вкладке должна быть кнопка, открывающая второй экран через push (с помощью сегвея). На открывшемся экране должна быть кнопка, программно (не через сегвей, а через код) открывающая еще один экран (хоть модально, хоть добавляя в навигационный стэк). Со второго экрана на третий должен передаваться какой-либо текст. Этот текст на третьем экране должен появляться анимированной (анимация не важна).

import UIKit

class ViewController: UIViewController {
		
	@IBOutlet weak var textField: UITextField!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
	
	@IBAction func nextScreen(_ sender: Any) {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let controller = storyboard.instantiateViewController(identifier: "Info") as! textViewController
		
		// передать текст из поля на другой экран
		present(controller, animated: true) {
			UIView.transition(with: controller.textResult,
				duration: 1,
				options: .transitionFlipFromTop,
				animations: {
					if let str = self.textField.text {
						if str.isEmpty {
							controller.textResult.text = "Текст не был введен"
						} else {
							controller.textResult.text = str
						}
					}
					controller.textResult.isHidden.toggle()
				},
				completion: nil)
		}
	}
	
}

