//
//  WordModel.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 14.04.2023.
//

import Foundation


struct Word { // это модель для отображения на экране ChallengeVC
    let word: String
    let translate: String
    let variants: [String]
}

struct WordModel: Codable { // вынести в отдеььный файл!  это модель которую парсим
    let id: Int
    let word, translate: String
    let order: Int
}
