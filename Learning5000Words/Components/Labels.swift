//
//  Labels.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit

class Labels: UILabel {
    
// MARK: - Common Labels
    
    static let wordLabel: UILabel = {
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
    
   static let translationLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Перевод слова"
        return label
    }()
    
//MARK: - Labels for Custom Cells

    static func wordLabelCell() -> UILabel { // общее свойство для learnedcell и notLearnedCell  почему именно метод надо создавать?
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemBlue.withAlphaComponent(0.6)
        return label
    }
    
    static func translationLabelCell() -> UILabel { // общее свойство для learnedcell и notLearnedCell  почему именно метод надо создавать?
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
    
    static let correctNotificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Правильно!"
        label.textAlignment = .center
        return label
    }()
    
// MARK: - Labels for IncorrectAnswer VC
    
    static let incorrectNotificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Не правильный ответ. Необходимо повторить"
        label.textAlignment = .center
        label.numberOfLines = 2
       return label
    }()
}
