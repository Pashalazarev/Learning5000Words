//
//  StackView.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 13.04.2023.
//

import UIKit

enum StackStyle {
    case forCell
    case forView // это для correct/incorrect View
    case forChallengeVC
}

final class StackView: UIStackView {
    
    init(style: StackStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .forCell:
            self.axis = .vertical
            self.alignment = .fill
            self.spacing = 5
        case .forView:
            self.axis = .vertical
            self.alignment = .center
            self.spacing = 15
        case .forChallengeVC:
            self.axis = .vertical
            self.alignment = .fill
            self.spacing = 15
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
