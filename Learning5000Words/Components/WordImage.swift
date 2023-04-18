//
//  WordImage.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 18.04.2023.
//

import Foundation
import UIKit

final class Image: UIImageView {
    
    static func wordImage() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.image = UIImage(named: "pic for answer")
        return image
    }

}
