//
//  StackView.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 13.04.2023.
//

import UIKit

enum StackStyle {
    case forCell
    case forCustomViews // это для correct/incorrect View
}

final class StackView: UIStackView {
    
    init(style: StackStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .forCell:
            self.axis = .vertical
            self.alignment = .fill
            self.spacing = 5
        case .forCustomViews:
            self.axis = .vertical
            self.alignment = .center
            self.spacing = 15
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    static func verticalStackView(withSpacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = withSpacing
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
