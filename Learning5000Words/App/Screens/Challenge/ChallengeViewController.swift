//
//  ChallengeViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit
import Foundation

final class ChallengeViewController: UIViewController {
    
    private let wordService = WordsService()
    
    private var currentWord: Word?
    
    private let headerLabel = Labels.headerLabel
    
    private var elements: [UIView] = []
    
    private let verticalStackView = StackView(style: .forChallengeVC)
    
    private let buttonsVerticalStackView: UIStackView = {  // добавил
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
    
       return stackView
    }()
    
    private let challengeView: ChallengeView = {
        let view = ChallengeView()
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        wordService.loadWords()
        currentWord = wordService.next()
        
        update()
        
        clueButtonTapped()
        
    }
    
    private func clueButtonTapped() { // метод для clue button
        Button.clueButton.addTarget(self, action: #selector(presentModallController), for: .touchUpInside)
    }
    
    @objc func presentModallController() {
        let vc = ClueViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
   private func update() {
    
       if let label = elements[2] as? UILabel {
           label.text = currentWord?.word
       }

        //4,5, 6, 7
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
        view.addSubview(ProgressView.progressView)
        view.addSubview(verticalStackView)
        view.addSubview(buttonsVerticalStackView)  // добавил
        
        self.elements = [ EmptyView.topEmptyView, headerLabel,
                          challengeView, EmptyView.lowerEmptyView
        ]
        
        var buttons = [UIButton]()
        for index in 0...3 {
            let button = Button.createAnswerButton()
            button.tag = index
            button.addTarget(self, action: #selector(variantButtonTapped(sender:)), for: .touchUpInside) // addtarget для кнопки
            button.setTitle("Variant \(index)", for: .normal)
            buttons.append(button)
        }
        buttons.forEach{buttonsVerticalStackView.addArrangedSubview($0)}  // добавил
        
        elements.append(contentsOf: buttons)
        
        elements.forEach { item in
            verticalStackView.addArrangedSubview(item)
        }
    }
    
    @objc func variantButtonTapped(sender: UIButton) { // что будет происходить при нажатии на кнопку
        
        let index = sender.tag
        
        if currentWord?.variants[index] == currentWord?.translate {
            sender.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.6, blue: 0.0, alpha: 0.7)
        } else {
            sender.backgroundColor = .red
        }
        
        currentWord = wordService.next()
        
        update()
        UIView.animate(withDuration: 0.5, delay: 0.7, options: .curveEaseInOut, animations: {sender.backgroundColor = .white.withAlphaComponent(0.5)}, completion: nil) // анимация при нажатии на кнопку + задержка в возвращении цвета на оригинальный
    }
    
    private func setupConstraints() {
        
        ProgressView.progressView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            make.left.right.equalTo(view).inset(10)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(ProgressView.progressView).inset(20)  // stackView крепится к proggressView
            make.left.right.equalTo(view).inset(20)
        }
        
        challengeView.snp.makeConstraints { make in
            make.left.right.equalTo(verticalStackView).inset(20)
        }
        
        buttonsVerticalStackView.snp.makeConstraints { make in
            make.top.equalTo(challengeView.snp.bottom).inset(10)
            make.left.right.equalTo(verticalStackView).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
}
