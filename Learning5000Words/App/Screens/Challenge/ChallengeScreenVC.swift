//
//  NewChallengeVCViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 02.06.2023.
//

import UIKit

class ChallengeScreenVC: UIViewController {
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .blue
        
        return stackView
    }()
    
    private let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .brown
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
}

extension ChallengeScreenVC {
    
    func setupViews() {
        view.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(<#T##view: UIView##UIView#>)
        
    }
    
    func setupConstraints() {
        
    }
}
