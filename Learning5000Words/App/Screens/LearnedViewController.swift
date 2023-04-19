//
//  LearnedListViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 11.04.2023.
//

import UIKit

final class LearnedViewController: UIViewController {
    
    var wordService = WordService() // ПОСМОТРЕТЬ ДЛЯ ЧЕГО ЭТО
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LearnedCell.self, forCellReuseIdentifier: LearnedCell.reuseId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        wordService.fetchWords()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(view)
        }
    }
    
}
extension LearnedViewController : UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wordService.words.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LearnedCell.reuseId, for: indexPath) as? LearnedCell else {
            return UITableViewCell()
        }
        let learnedList = wordService.words[indexPath.row]
        cell.update(learnedList)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
