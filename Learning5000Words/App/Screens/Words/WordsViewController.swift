//
//  WordsViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit
import SnapKit

final class WordsViewController: UIViewController {
    
    var wordService = WordsService()
   
    lazy var tableView: UITableView = {
        var tableView = UITableView.init()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WordsCell.self, forCellReuseIdentifier: WordsCell.reuseID)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

        wordService.loadWords()
    }
    

    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }
    
    func showChallengeScreen() {
        let challengeVC = ChallengeViewController()
        navigationController?.pushViewController(challengeVC, animated: true)
    }
}

extension WordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wordService.words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordsCell.reuseID, for: indexPath) as? WordsCell else {
            return UITableViewCell()
        }
        let wordsList = wordService.words[indexPath.row]
        cell.update(wordsList)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        showChallengeScreen()
        
    }
}
