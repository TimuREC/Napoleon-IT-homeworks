//
//  PhotoCell.swift
//  Lesson 6
//
//  Created by mono on 05.12.2020.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    override func prepareForReuse() {
        self.imageView.image = nil
    }
    
    func setImage(photoModel: Photo, closure: @escaping (UIImage?) -> Void) {
        
        if let image = photoModel.image {
            self.imageView.image = image
            return
        }
        
        guard let imageURL = URL(string: photoModel.url) else { return }
        
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: imageURL) else { return }
//
//            let image = UIImage(data: imageData)
//            closure(image)
//
//            DispatchQueue.main.async {
//                self.imageView.image = image
//            }
//        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            if let data = data,
               let image = UIImage(data: data) {
                closure(image)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }.resume()
        
        
        
    }
    
}
