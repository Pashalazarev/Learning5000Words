//
//  WordInformayionViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 03.04.2023.
//

import UIKit


final class CorrectAnswerWiewController: UIViewController {

   private let correctView: CorrectView = {
        let view = CorrectView()
        view.heightAnchor.constraint(equalToConstant: 600).isActive = true
        
        return view
    }()
    
    private let correctVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
//        stackView.backgroundColor = .blue.withAlphaComponent(0.3)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(correctVerticalStackView)
        
        let elements = [ProgressView.progressView, Labels.notificationLabel,
                        correctView, Button.nextStepButton
        ]
        
        elements.forEach { element in
            correctVerticalStackView.addSubview(element)
        }
    }
    
    private func setupConstraints() {
        correctVerticalStackView.snp.makeConstraints { make in // может быть надо добавить bottom
            make.top.equalTo(view).inset(50)
            make.left.right.equalTo(view).inset(20)
        }
        
        correctView.snp.makeConstraints { make in
            make.top.equalTo(correctVerticalStackView).inset(70)
            make.bottom.equalTo(correctVerticalStackView).inset(40)
            make.left.right.equalTo(correctVerticalStackView).inset(10)
        }
    }
    
}
