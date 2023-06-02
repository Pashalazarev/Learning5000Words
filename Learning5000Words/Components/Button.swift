//
//  Button.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit

enum ButtonStyle {
    case sound
    case clue
    case answer
}
final class Button: UIButton {
    
    init(type: ButtonStyle, text: String) {
        super.init(frame: .zero)
        
        switch type {
        case .sound:
            configureSoundButton()
        case .clue:
            configureClueButton()
        case .answer:
            configureAnswerButton(text: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSoundButton() {
        self.setImage(UIImage(systemName: "speaker.wave.2.fill"), for: .normal)
        
    }
    
    func configureClueButton() {
        self.setImage(UIImage(systemName: "hint"), for: .normal)
        
    }
    
    func configureAnswerButton(text: String) {
        self.setTitle(text, for: .normal)
        self.backgroundColor = .systemGray
        self.layer.cornerRadius = 16
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.widthAnchor.constraint(equalToConstant: 250).isActive = true
        self.clipsToBounds = true
        
    }
    
    
}
