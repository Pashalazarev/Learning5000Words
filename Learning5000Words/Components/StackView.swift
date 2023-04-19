//
//  StackView.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 13.04.2023.
//

import UIKit

final class StackView: UIStackView {

    static func verticalStackView(withSpacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }
    
    static func customVerticalStackView(withSpacing: CGFloat, withAlignment: Alignment) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = withAlignment
        stackView.spacing = withSpacing
        return stackView
    }
    
    // MARK: - VerticalStackView for customViews
  
}
