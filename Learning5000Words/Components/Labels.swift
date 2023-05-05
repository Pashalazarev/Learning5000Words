//
//  Labels.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit

enum HeaderLabelStyle {
    case correctAnswer
    case incorrectAnswer
    case translationLabel
    case transcriptionLabel
}

final class Labels: UILabel {
    
    init (style: HeaderLabelStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .correctAnswer:
            self.textColor = .black
            self.text = "Правильно!"
            self.textAlignment = .center
        case .incorrectAnswer:
            self.textColor = .black
            self.text = "Не правильный ответ. Необходимо повторить!"
            self.textAlignment = .center
            self.numberOfLines = 2
        case .translationLabel:
            self.textColor = .black
            self.font = UIFont.boldSystemFont(ofSize: 25)
            self.text = "Тут будет перевод слова"
        case .transcriptionLabel:
            self.textColor = .gray.withAlphaComponent(0.3)
            self.textAlignment = .center
            self.font = UIFont.boldSystemFont(ofSize: 20)
            self.text = "[ˈprɪti]"
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Common Labels
    
    static let wordLabel: UILabel = { // этот тоже в enum
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "pretty"
        return label
    }()

    static let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 2
        label.text = "Тут будет подробное описание слова которое надо описать"
       return label
    }()
    
//MARK: - Labels for Custom Cells

    static func wordLabelCell() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemBlue.withAlphaComponent(0.6)
        return label
    }
    
    static func translationLabelCell() -> UILabel { 
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        return label
    }
    
// MARK: - Labels for CorrectAnswer VC
    
    static let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Выбери правильный ответ"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    static let transcriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray.withAlphaComponent(0.3)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "[ˈprɪti]"
        label.textAlignment = .center
        return label
    }()
}
