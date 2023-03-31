//
//  ChallengeView.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import Foundation
import UIKit

class ChallengeView: UIView {
    
    private let verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 20
        
        return verticalStackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .systemTeal.withAlphaComponent(0.2)
        self.layer.cornerRadius = 20

        self.addSubview(verticalStackView)
        self.addSubview(Button.clueButton)
        
        let elements = [ Button.soundButton, Labels.wordLabel, Labels.transcriptionLabel ]
        elements.forEach { elements in
            verticalStackView.addArrangedSubview(elements)
        }
    }
    
    private func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
        Button.clueButton.snp.makeConstraints { make in
            make.right.bottom.equalTo(self).inset(10)
        }
    }
}
