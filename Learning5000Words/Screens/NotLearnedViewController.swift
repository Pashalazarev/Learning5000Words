//
//  NotLearnedViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 11.04.2023.
//

import UIKit

final class NotLearnedViewController: UIViewController {
    
    private var wordService = WordService()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NotLearnedCell.self, forCellReuseIdentifier: NotLearnedCell.reuseId)
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
extension NotLearnedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wordService.words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotLearnedCell.reuseId, for: indexPath) as? NotLearnedCell else {
            return UITableViewCell()
        }
        let notLearnedList = wordService.words[indexPath.row]
        cell.update(notLearnedList)
        
        return cell
    }
}
