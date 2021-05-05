//
//  ImageView+Extension.swift
//  SentiaCodeChallenge
//
//  Created by Clayton on 5/5/21.
//

import Foundation
import UIKit

extension UIImageView {
    // fetch image from a web service endpoint
    func setImageFromUrl(imageURL :String, completion : @escaping (Bool)->()){
       URLSession.shared.dataTask( with: NSURL(string:imageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.image = UIImage(data: data)
                completion(true)
             }
          }
       }).resume()
    }
}
