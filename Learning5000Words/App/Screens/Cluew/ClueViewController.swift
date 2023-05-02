//
//  ClueViewController.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 02.05.2023.
//

import Foundation
import UIKit

class ClueViewController: UIViewController {

    private let verticalStacKView = StackView(style: .forView)
    private let wordImage = Image(style: .forView)
    
    private let clueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private let dimmedView: UIView = { // этой вью будет скрываться та часть экрана которая остается открытой
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.6)
        return view
    }()
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissClue))
        dimmedView.addGestureRecognizer(tapGesture)
    }
    
    
    func setupViews() {
        view.addSubview(dimmedView)
        view.addSubview(clueView)
        verticalStacKView.addArrangedSubview(wordImage)
        verticalStacKView.addArrangedSubview(Labels.descriptionLabel)
        clueView.addSubview(verticalStacKView)
    }
    
    func setupConstraints() {
        Labels.descriptionLabel.snp.makeConstraints { make in
            make.right.left.top.bottom.equalTo(clueView).inset(20)
        }
        clueView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
        }
        verticalStacKView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(clueView)
        }
        dimmedView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(view)
        }
    }
 // MARK: - Hiding clueInformation
    @objc private func dismissClue() {
        dismiss(animated: true, completion: nil)
    }
}
