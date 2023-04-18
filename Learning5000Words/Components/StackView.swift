//
//  StackView.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 13.04.2023.
//

import UIKit

final class StackView: UIStackView {
    
    static func verticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }
}
