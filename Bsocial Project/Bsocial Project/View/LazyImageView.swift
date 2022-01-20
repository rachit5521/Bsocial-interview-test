//
//  LazyImageView.swift
//  Bsocial Project
//
//  Created by Rachit Prajapati on 20/01/22.
//
import UIKit

final class LazyImageView: UIImageView {
    
    private let cache = NSCache<AnyObject, UIImage>()
    
    func loadImage(str: String, placeholderImage: UIImage) {
      
        let url = URL(string: str)!
       
        if let cachedImage = cache.object(forKey: url as AnyObject) {
            debugPrint("DBG: image loaded from cache for =\(url)")
            self.image = cachedImage
            return
        }
       
        self.image = placeholderImage
        
        DispatchQueue.global().async { [weak self] in
            if let imgData =  try? Data(contentsOf: url) {
                if let image = UIImage(data: imgData) {
                    DispatchQueue.main.async {
                        self?.cache.setObject(image, forKey: url as AnyObject)
                        self?.image = image
                    }
                }
            }
        }
    }
}
