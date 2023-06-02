//
//  TabBarController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 06.04.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let wordsVC: WordsViewController = {
        let controller = WordsViewController()
        let image = UIImage(systemName: "menucard")
        let selectedImage = UIImage(systemName: "menucard.fill")
        let tabItem = UITabBarItem.init(title: "Меню", image: image, selectedImage: selectedImage)
        tabItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 9)], for: .normal)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private let challengeVC: NewChallengeViewController = {
        let controller = NewChallengeViewController()
        let image = UIImage(systemName: "questionmark.circle")
        let selectedImage = UIImage(systemName: "questionmark.circle.fill")
        let tabItem = UITabBarItem.init(title: "Варианты ответа", image: image, selectedImage: selectedImage)
        tabItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 9)], for: .normal)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private let correctAnswerVC: CorrectAnswerWiewController = {
        let controller = CorrectAnswerWiewController()
        let image = UIImage(systemName: "hand.thumbsup")
        let selectedImage = UIImage(systemName: "hand.thumbsup.fill")
        let tabItem = UITabBarItem.init(title: "Ответил верно", image: image, selectedImage: selectedImage)
        tabItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 9)], for: .normal)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private let incorrectAnswerVC: IncorrectAnswerViewController = {
        let controller = IncorrectAnswerViewController()
        let image = UIImage(systemName: "hand.thumbsdown")
        let selectedImage = UIImage(systemName: "hand.thumbsdown.fill")
        let tabItem = UITabBarItem.init(title: "Ответил не верно", image: image, selectedImage: selectedImage)
        tabItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 9)], for: .normal)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private let learnedVC: LearnedViewController = {
        let controller = LearnedViewController()
        let image = UIImage(systemName: "book.closed")
        let selectedImage = UIImage(systemName: "book.closed.fill")
        let tabItem = UITabBarItem.init(title: "Выученные слова", image: image, selectedImage: selectedImage)
        tabItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 9)], for: .normal)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    private let notLearnedVC: NotLearnedViewController = {
        let controller = NotLearnedViewController()
        let image = UIImage(systemName: "book")
        let selectedImage = UIImage(systemName: "book.fill")
        let tabItem = UITabBarItem.init(title: "Невыученные слова", image: image , selectedImage: selectedImage)
        tabItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 9)], for: .normal)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tabBar.tintColor = .green
        viewControllers = [UINavigationController.init(rootViewController: wordsVC) , challengeVC, correctAnswerVC, learnedVC, notLearnedVC]
        
    }
    
    private func showChallengeVC() { // назвать иначе метод
        let navigationController = UINavigationController()
        let rootVC = WordsViewController()
        let challengeVC = ChallengeViewController()
        navigationController.setViewControllers([rootVC, challengeVC], animated: true)
    }
}
