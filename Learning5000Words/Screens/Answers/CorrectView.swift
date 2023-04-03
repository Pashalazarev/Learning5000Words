//
//  CorrectView.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 03.04.2023.
//

import UIKit
import Foundation

final class CorrectView: UIView {
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 15
        
        return stackView
    }()
    
    let containerView: UIView
    
    let wordImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.shadowOpacity = 0
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        image.widthAnchor.constraint(equalToConstant: 230).isActive = true
        image.image = UIImage(named: "pic for correct answer")
        
        return image
    }()
    
    let translationLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Перевод слова"
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 2
        label.text = "Тут будет подробное описание слова которое надо описать"
        
       return label
    }()
    // текст англ.слова не должен быть жирным
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     private func setupViews() {
         self.layer.cornerRadius = 20
         self.layer.borderWidth = 3 // рамка
         self.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
         self.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
         self.layer.shadowOffset = CGSize(width: 0, height: 3)
         self.layer.shadowOpacity = 1
         
         self.addSubview(verticalStackView)
         self.addSubview(descriptionLabel)
         
         let elements = [wordImageView, Button.soundButton, translationLabel,
                         Labels.transcriptionLabel, Labels.wordLabel
         ]
         
         elements.forEach { element in
             verticalStackView.addArrangedSubview(element)
         }
     }

    private func setupConstraints() {
        
        verticalStackView.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(40)
            make.top.equalTo(self).inset(40)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self).inset(10)
        }
   }
}
// MARK:  - вопросы
// почему тень у элементов во вью?
