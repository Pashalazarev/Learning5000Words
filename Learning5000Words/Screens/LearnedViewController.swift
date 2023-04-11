//
//  LearnedListViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 11.04.2023.
//

import UIKit
import SnapKit

final class LearnedViewController: UIViewController {
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
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
        studiedWords.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LearnedCell.reuseId, for: indexPath) as? LearnedCell else {
            return UITableViewCell()
        }
        let learnedList = studiedWords[indexPath.row]
        
        return cell
    }
    
}
