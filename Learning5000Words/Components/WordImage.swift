//
//  WordImage.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 18.04.2023.
//

import UIKit

enum ImageStyle {
    case tableViewImage
    case viewImage
}
final class Image: UIImageView {
    
    init(style: ImageStyle, image: UIImage) {
        super.init(frame: .zero)
        
        switch style {
        case .tableViewImage:
            configureTableViewImage(image: image)
         
        case .viewImage:
            configureTableViewImage(image: image)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configureTableViewImage(image: UIImage) {
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.image = image
    }
    
    func configureViewImage(image: UIImage) {
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.widthAnchor.constraint(equalToConstant: 250).isActive = true
        self.image = image
    }
}
