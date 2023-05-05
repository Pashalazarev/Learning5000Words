//
//  WordsArchivier.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 05.05.2023.
//

import Foundation

protocol ArchiverInput {
    func save(_ words: [Word]) // сохраняет массив слов
    func fetchWords() -> [Word] // получает сохраненный массив из usrDefaults
}

final class WordsArchiver: ArchiverInput {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let userDefaults = UserDefaults.standard
    
    private let key = "Words"
   
    // MARK: - Public methods
    
    func save(_ words: [Word]) {
        do {
            let data = try encoder.encode(words)
            userDefaults.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
   func fetchWords() -> [Word] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        do {
            let array = try decoder.decode([Word].self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
}
