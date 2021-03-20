//
//  ViewController.swift
//  Lesson 6
//
//  Created by mono on 05.12.2020.
//

import UIKit

class ViewController: UIViewController, Keyboard {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        textField.delegate = self
    }
    
    private func setupPhotos() {
//        photos = Array(repeating: Photo(url: "https://picsum.photos/500"), count: 30)
        
        guard let imageURL = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            if let data = data,
               let photos = try? JSONDecoder().decode([Photo].self, from: data)
            {
                self.photos = photos.prefix(42).map { Photo(url: $0.url, title: $0.title) }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }.resume()
    }
    
    @IBAction func startDownload(_ sender: Any) {
        setupPhotos()
    }

}

protocol Keyboard {
    var collectionView: UICollectionView! { get set }
}

extension Keyboard {
    func keyboardWillShow() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.contentInset.bottom = 350
    }

    func keyboardWillHide() {
		collectionView.contentInset.bottom = .zero
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        keyboardWillHide()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardWillShow()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.item
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.setImage(photoModel: photos[index]) { [weak self] image in
            self?.photos[index].image = image
        }
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 40.1) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "PhotoView") as! PhotoViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        
        present(controller, animated: true) {
            controller.imageLabel.text = "\(self.photos[indexPath.item].title)"
            controller.imageLabel.isHidden.toggle()
            controller.largeImageView.image = self.photos[indexPath.item].image
        }
    }
    
}

struct Photo: Decodable {
    var url: String
    var image: UIImage?
    var title: String
    
    init(url: String, title: String) {
        self.url = url
        self.title = title
    }
    
    private enum CodingKeys: String, CodingKey {
        case url = "url"
        case title = "title"
    }
}

