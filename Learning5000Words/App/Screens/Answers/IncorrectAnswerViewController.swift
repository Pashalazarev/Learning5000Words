//
//  IncorrectAnswerViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 10.04.2023.
//

import UIKit

final class IncorrectAnswerViewController: UIViewController {
    
    private let incorrectView: IncorectView = {
        let view = IncorectView()
        
        return view
    }()
    
    private let verticalStackView = StackView.verticalStackView(withSpacing: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(verticalStackView)
        view.addSubview(Button.nextStepButton)
        
        let elemets = [ProgressView.progressView,Labels.incorrectNotificationLabel,incorrectView]
        
        elemets.forEach { element in
            verticalStackView.addArrangedSubview(element)
        }
    }
    private func setupConstraints() {

        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(view).inset(90)
            make.left.right.equalTo(view).inset(20)
            make.bottom.equalTo(view).inset(140)
        }
        
        incorrectView.snp.makeConstraints { make in
            make.top.equalTo(verticalStackView).inset(90)
            make.left.right.equalTo(verticalStackView)
        }

        Button.nextStepButton.snp.makeConstraints { make in
            make.bottom.equalTo(incorrectView).inset(-90)
            make.left.right.equalTo(incorrectView)
        }
        
        ProgressView.progressView.snp.makeConstraints { make in
            make.top.equalTo(verticalStackView).inset(20)
        }
    }
}
