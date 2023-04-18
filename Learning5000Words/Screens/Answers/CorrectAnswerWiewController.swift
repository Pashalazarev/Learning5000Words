//
//  WordInformayionViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 03.04.2023.
//

import UIKit
//import SnapKit

final class CorrectAnswerWiewController: UIViewController {
    
    
    private let correctView: CorrectView = {
        let view = CorrectView()
        return view
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
   
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(verticalStackView)
        view.addSubview(Button.nextStepButton)
        
        let elements = [ProgressView.progressView, Labels.correctNotificationLabel,correctView]
        
        elements.forEach { element in
            verticalStackView.addArrangedSubview(element)
        }
    }
    
    private func setupConstraints() {

        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(view).inset(90)
            make.left.right.equalTo(view).inset(20)
            make.bottom.equalTo(view).inset(140)
        }
        
        correctView.snp.makeConstraints { make in
            make.top.equalTo(verticalStackView).inset(90)
            make.left.right.equalTo(verticalStackView)
        }

        Button.nextStepButton.snp.makeConstraints { make in
            make.bottom.equalTo(correctView).inset(-90)
            make.left.right.equalTo(correctView)
        }
        
        ProgressView.progressView.snp.makeConstraints { make in
            make.top.equalTo(verticalStackView).inset(20)
        }
    }
}
