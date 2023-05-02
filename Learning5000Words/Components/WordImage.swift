//
//  WordImage.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 18.04.2023.
//

import Foundation
import UIKit

enum ImageStyle {
    case forTableView // для  tableViewController
    case forView // для обычных контроллеров
}
final class Image: UIImageView {
    
    init(style: ImageStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .forTableView:
            self.heightAnchor.constraint(equalToConstant: 30).isActive = true
            self.widthAnchor.constraint(equalToConstant: 30).isActive = true
            self.image = UIImage(named: "pic for answer")
        case .forView:
            self.heightAnchor.constraint(equalToConstant: 150).isActive = true
            self.widthAnchor.constraint(equalToConstant: 250).isActive = true
            self.image = UIImage(named: "pic for answer")
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static func wordImage() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.image = UIImage(named: "pic for answer")
        return image
    }

}
