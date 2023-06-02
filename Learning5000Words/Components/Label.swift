//
//  Labels.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit

enum LabelStyle {
    case wordLabel
    case headLineLabel
    case transcriptionLabel
}

final class Label: UILabel {
    
    init(type: LabelStyle, text: String) {
        super.init(frame: .zero)
        
        switch type {
        case .wordLabel:
            configureWordLabel(text: text)
        case .headLineLabel:
            configureHeaderLabel(text: text)
        case .transcriptionLabel:
            configureTranscriptionLabel(text: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWordLabel(text: String) {
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 30)
        self.textAlignment = .center
    }
    
    func configureHeaderLabel(text: String) {
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: 30)
        self.textAlignment = .center
    }
    
    func configureTranscriptionLabel(text: String) {
        self.text = "[ca:r]"
        self.textAlignment = .center
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.textColor = .systemGray
        
    }
}
