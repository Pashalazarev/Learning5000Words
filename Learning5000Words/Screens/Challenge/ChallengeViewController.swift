//
//  ChallengeViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit
import SnapKit

final class ChallengeViewController: UIViewController {
    
   private let challengeView: ChallengeView = {
        let view = ChallengeView()
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        return view
    }()
    private let stackViewSpacing: CGFloat = 10
    
//    private let challengeVertivalStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        return stackView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(StackView.verticalStackView(withSpacing: stackViewSpacing))
        
        var elements = [ProgressView.progressView, EmptyView.topEmptyView, Labels.headerLabel,
                        challengeView, EmptyView.lowerEmptyView
        ]
       
        var buttons = [UIButton]()
        for index in 1...4 {
            let button = Button.createAnswerButton()
            button.setTitle("Variant \(index)", for: .normal)
            buttons.append(button)
        }
        
        elements.append(contentsOf: buttons)
        
        elements.forEach { item in
            StackView.verticalStackView(withSpacing: stackViewSpacing).addArrangedSubview(item)
        }
    }
    
    private func setupConstraints() {
        
        StackView.verticalStackView(withSpacing: stackViewSpacing).snp.makeConstraints { make in
            make.top.equalTo(view).inset(60)
            make.left.right.equalTo(view).inset(40)
        }

        challengeView.snp.makeConstraints { make in
            make.left.right.equalTo(StackView.verticalStackView(withSpacing: stackViewSpacing)).inset(25)
        }
    }
}
