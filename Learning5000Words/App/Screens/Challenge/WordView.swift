//
//  WordView.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 30.05.2023.
//

import UIKit

final class WordView: UIView {
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray
        containerView.layer.cornerRadius = 16
        
        return containerView
    }()
    
    private let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .systemMint
        
        return stackView
    }()

    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension WordView {
    
   private func setupViews() {
        self.addSubview(containerView)
        containerView.addSubview(verticalStackView)
        
    }
   private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(250)
            make.center.equalTo(self)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.center.equalTo(containerView)
        }
    }
}
