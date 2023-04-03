//
//  PrgressView.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 03.04.2023.
//

import Foundation
import UIKit

final class ProgressView: UIProgressView {
    
   static let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.transform = progressView.transform.scaledBy(x: 0.5, y: 2)
        progressView.layer.cornerRadius = 2
        progressView.progress = 0.5
        
        return progressView
    }()
}
