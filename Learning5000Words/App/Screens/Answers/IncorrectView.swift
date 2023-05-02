//
//  IncorrectView.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 10.04.2023.
//
import UIKit

final class IncorectView: UIView {
    
    private let wordImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.shadowOpacity = 0
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        image.widthAnchor.constraint(equalToConstant: 230).isActive = true
        image.image = UIImage(named: "pic for answer")
        
        return image
    }()
    
    private let verticalStackView = StackView(style: .forView)
    private let transcriptionLabel = Labels(style: .transcriptionLabel)
    private let translationLabel = Labels(style: .translationLabel)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 3 // рамка
        self.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        self.layer.shadowColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1
        
        self.addSubview(verticalStackView)
        self.addSubview(Labels.descriptionLabel)
        
        let elements = [wordImageView, Button.soundButton, translationLabel,
                        transcriptionLabel, Labels.wordLabel
        ]
        
        elements.forEach { element in
            verticalStackView.addArrangedSubview(element)
        }
    }
    
    func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(40)
            make.top.equalTo(self).inset(40)
        }
        Labels.descriptionLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self).inset(10)
        }
    }
    
}
