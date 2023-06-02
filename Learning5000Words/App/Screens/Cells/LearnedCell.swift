//
//  LearnedCellTableViewCell.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 11.04.2023.
//

import UIKit

final class LearnedCell: UITableViewCell {
    
    static let reuseId = "LearnedCell"
    
    lazy var wordImage = Image(style: .tableViewImage)
    lazy var verticalStackView = StackView(style: .forCell)
    
    private let wordLabelCell = Label.wordLabelCell()
    private let translationLabelCell = Label.translationLabelCell()
    
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
        contentView.addSubview(verticalStackView)
        contentView.addSubview(wordImage)
        verticalStackView.addArrangedSubview(wordLabelCell)
        verticalStackView.addArrangedSubview(translationLabelCell)
        
    }
    
    private func setupConstraints() {
        wordImage.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).inset(16)
            make.top.bottom.equalTo(contentView).inset(8)
        }
        verticalStackView.snp.makeConstraints { make in
            make.left.equalTo(wordImage.snp.right).offset(8)
            make.top.equalTo(contentView.snp.top).inset(6)
            make.bottom.equalTo(contentView.snp.bottom).inset(6)
        }
    }
    
    func update(_ word: WordModel) {
        wordLabelCell.text = word.word
        translationLabelCell.text = word.translate
    }
}
