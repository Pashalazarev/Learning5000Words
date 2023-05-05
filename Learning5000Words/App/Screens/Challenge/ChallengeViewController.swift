//
//  ChallengeViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit
import Foundation

final class ChallengeViewController: UIViewController {
    
    // MARK: - проверка для WordsArchiver
    let wordArchiver = WordsArchiver()
    let wordsToSave = [Word(word: "Hello", translate: "Привет", variants: ["Досвидание", "Добрый день"]), Word(word: "Index", translate: "Индекс", variants: ["Массив", "Жопа"])]
    
    
    
    private let wordService = WordsService()
    
    private var currentWord: Word?
    
    private let wordLabel = Labels.headerLabel
    
    private var elements: [UIView] = []
    
    private let verticalStackView = StackView(style: .forChallengeVC)
    
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
        
        wordArchiver.save(wordsToSave)
        verifyWordsArchiver()
        
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

        if let label = elements[1] as? UILabel {
            label.text = currentWord?.word
        }

        if let view = elements[2] as? ChallengeView {
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
        for index in 0...3 {
            let button = Button.createAnswerButton()
            button.tag = index
            button.addTarget(self, action: #selector(variantButtonTapped(sender:)), for: .touchUpInside) // addtarget для кнопки
            button.setTitle("Variant \(index)", for: .normal)
            buttons.append(button)
        }
        
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
    
    func verifyWordsArchiver() {
        let saveWords = wordArchiver.fetchWords()
        if saveWords == wordsToSave {
            print("Архиватор работает")
        } else {
            print("Массивы не совпадают")
        }
    }
}
