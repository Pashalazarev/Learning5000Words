//
//  TabBarController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 06.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let wordsVC: WordsViewController = {
        let controller = WordsViewController()
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem.init(title: "Меню", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private let challengeVC: ChallengeViewController = {
        let controller = ChallengeViewController()
        let image = UIImage(systemName: "questionmark.circle")
        let selectedImage = UIImage(systemName: "questionmark.circle.fill")
        let tabItem = UITabBarItem.init(title: "Выбери вариант ответа", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private let correctAnswerVC: CorrectAnswerWiewController = {
        let controller = CorrectAnswerWiewController()
        let image = UIImage(systemName: "hand.thumbsup")
        let selectedImage = UIImage(systemName: "hand.thumbsup.fill")
        let tabItem = UITabBarItem.init(title: "Ответил верно", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    // TODO: сделать таб бар для 3х экранов (incorrectAnswerVC, экраны где лежат выученные слова и и нет)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tabBar.tintColor = .green
        viewControllers = [wordsVC, challengeVC, correctAnswerVC]
    }
}
