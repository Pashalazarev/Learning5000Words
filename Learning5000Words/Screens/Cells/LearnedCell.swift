//
//  LearnedCellTableViewCell.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 11.04.2023.
//

import UIKit

class LearnedCell: UITableViewCell {

    static let reuseId = "LearnedCell"
    
    private let verticalSTackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center // не вакт что надо, так как элементы в стеке можно расставить сверху и снизу! Надо проверить
        
        return stackView
    }()
    
    private let worldLabel: UILabel = { // может быть сделать 1 свойство для лейбла во всех ячейках
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .systemBlue.withAlphaComponent(0.6)
        
        return label
    }()
    
    private let translationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        
        return label
    }()
    
    private let wordImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 25).isActive = false
        image.widthAnchor.constraint(equalToConstant: 25).isActive = false
        image.layer.cornerRadius = image.frame.width / 2
        image.clipsToBounds = true // проверить как отображается картинка
        
        return image
    }()
    
    
// MARK: - какой тут марк?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - может быть тут тоже нужен?
    private func setupViews() {
        contentView.addSubview(verticalSTackView)
        verticalSTackView.addArrangedSubview(worldLabel)
        verticalSTackView.addArrangedSubview(translationLabel)
        // доделать
    }
    
    private func setupConstraints() {
        // доделать
    }

    func update(_ word: Words) {
        worldLabel.text = word.name
        translationLabel.text = word.translation
    }
}
