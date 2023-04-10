//
//  Button.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit

final class Button: UIButton {

    // MARK: - Common buttons
    
    static let soundButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.init(systemName: "speaker.wave.2.fill"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    static let nextStepButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 15
        button.heightAnchor.constraint(equalToConstant: 53).isActive = true
        button.setTitle("Далее", for: .normal)
    
        return button
    }()
    // MARK: - Buttons for CorrectAnswer VC
    
    static func createAnswerButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .white.withAlphaComponent(0.5)
        button.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 15
        button.heightAnchor.constraint(equalToConstant: 53).isActive = true
        button.setTitle("Вариант 1", for: .normal)
        
        return button
    }
    
    static let clueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.init(systemName: "lightbulb"), for: .normal)
        
        return button
    }()
    
    // MARK: - Buttons for IncorrectAnswer VC
}
