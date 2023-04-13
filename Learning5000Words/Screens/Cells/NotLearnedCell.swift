//
//  NotLearnedCell.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 11.04.2023.
//

import UIKit

final class NotLearnedCell: UITableViewCell {
    static let reuseId = "NotLearnedCell"
    
    private let containerView: UIView = {
        let container = UIView()
        
        
       return container
    }()
    private let verticalSTackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    private let wordLabel: UILabel = { // общее свойство для learnedcell и notLearnedCell
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .systemBlue.withAlphaComponent(0.6)
        return label
    }()
    
    private let translationLabel: UILabel = { // общее свойство для learnedcell и notLearnedCell
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        return label
    }()
    
    private let wordImage: UIImageView = { // общее свойство для learnedcell и notLearnedCell
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.image = UIImage(named: "pic for answer")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(verticalSTackView)
        contentView.addSubview(wordImage)
        verticalSTackView.addArrangedSubview(wordLabel)
        verticalSTackView.addArrangedSubview(translationLabel)
    }
    private func setupConstraints() {
        wordImage.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).inset(16)
            make.top.bottom.equalTo(contentView).inset(8)
        }
        verticalSTackView.snp.makeConstraints { make in
            make.left.equalTo(wordImage.snp.right).offset(8)
            make.top.equalTo(contentView.snp.top).inset(6)
            make.bottom.equalTo(contentView.snp.bottom).inset(6)
        }
    }
    
     func update(_ word: Words) {
        wordLabel.text = word.name
        translationLabel.text = word.translation
    }
}

