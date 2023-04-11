//
//  WordsCellTableViewCell.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import UIKit
import SnapKit

class WordsCell: UITableViewCell {
    
    static let reuseID = "WordsCell"
    // MARK: - Creating elements
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 20
        view.backgroundColor = .blue.withAlphaComponent(0.1)
        return view
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView.init()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return stackView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray.withAlphaComponent(0.3)
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let soundButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.init(systemName: "speaker.wave.2.fill"), for: .normal)
        button.layer.cornerRadius = 20
        button.tintColor = .black
        button.backgroundColor = .systemGray.withAlphaComponent(0.1)
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
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
        contentView.addSubview(containerView)
        containerView.addSubview(soundButton)
        
        containerView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView).inset(8)
        }
        soundButton.snp.makeConstraints { make in
            make.left.equalTo(containerView.snp.left).offset(8)
            make.centerY.equalTo(containerView.snp.centerY)
        }
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(containerView).inset(8)
            make.left.equalTo(soundButton.snp.right).offset(8)
        }
    }
    
    func update(_ word: Words) {
        nameLabel.text = word.name
        descriptionLabel.text = word.description
    }
}
