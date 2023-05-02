//
//  ChallengeViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit
import Foundation

final class ChallengeViewController: UIViewController {
    
    private var challengeRootView: ChallengeRootView {return self.view as! ChallengeRootView} //как сделать через as?
    
    private let wordService = WordsService()
    
    private var currentWord: Word?
    
    private let wordLabel = Labels.headerLabel
    
    private var elements: [UIView] = []
    
    private let verticalStackView = StackView(style: .forView)
    
    private let challengeView: ChallengeView = {
        let view = ChallengeView()
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        return view
    }()
    
    override func loadView() {
        self.view = ChallengeRootView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        wordService.loadWords()
        currentWord = wordService.next()
        
        update()
    }
    
    func update() {

        if let label = elements[2] as? UILabel {
            label.text = currentWord?.word
        }

        if let view = elements[3] as? ChallengeView {
            if let label = view.elements[1] as? UILabel {
                label.text = currentWord?.word
            }
        }

        //5, 6, 7
        if let button = elements[4] as? UIButton {

            button.setTitle(currentWord?.variants[0], for: .normal)
        }

        if let button = elements[5] as? UIButton {

            button.setTitle(currentWord?.variants[1], for: .normal)
        }

        if let button = elements[6] as? UIButton {

            button.setTitle(currentWord?.variants[2], for: .normal)
        }

        if let button = elements[7] as? UIButton {

            button.setTitle(currentWord?.variants[3], for: .normal)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(verticalStackView)
        view.addSubview(ProgressView.progressView)
        
        self.elements = [ EmptyView.topEmptyView, wordLabel,
                          challengeView, EmptyView.lowerEmptyView
        ]
        
        var buttons = [UIButton]()
        for index in 1...4 {
            let button = Button.createAnswerButton()
            button.addTarget(self, action: #selector(variantButtonTapped(sender:)), for: .touchUpInside) // addtarget для кнопки
            button.setTitle("Variant \(index)", for: .normal)
            buttons.append(button)
        }
        
        elements.append(contentsOf: buttons)
        
        elements.forEach { item in
            verticalStackView.addArrangedSubview(item)
        }
    }
    
    @objc func variantButtonTapped(sender: UIButton) { // тут пишет то что будет сделано когда нажимается кнопка
        currentWord = wordService.next()
        
        update()
    }
    
    private func setupConstraints() {
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(view).inset(60)
            make.left.right.equalTo(view).inset(40)
        }
        
        challengeView.snp.makeConstraints { make in
            make.left.right.equalTo(verticalStackView).inset(25)
        }
        
        ProgressView.progressView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.left.right.equalTo(view).inset(20)
        }
    }
}
