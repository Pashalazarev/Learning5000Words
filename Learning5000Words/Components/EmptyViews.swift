//
//  EmptyViews.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 04.04.2023.
//

import UIKit

final class EmptyView: UIView {
    
    static let topEmptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return view
    }()
    
    static let lowerEmptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return view
    }()
}
