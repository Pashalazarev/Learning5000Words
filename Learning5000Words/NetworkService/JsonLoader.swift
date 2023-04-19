//
//  JsonLoader.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 19.04.2023.
//

import Foundation

final class JsonLoader {
    enum WordsLoadingError: Error {
        case fileNotFound
        case fileLoadingFailed
        case jsonDecodingFailed
    }
    
    private func loadWords(fileName: String) -> [Word2]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
            let data = try Data(contentsOf: url)
            let jsonData = try JSONDecoder().decode([Word2].self, from: data)
            return jsonData
                
            } catch {
                print("error: \(error)")
                return nil
            }
        }
        return nil
    }
    
    private func loadWords2(fileName: String) -> Result <[Word2], WordsLoadingError> {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return .failure(.fileNotFound)
        }
        guard let data = try? Data(contentsOf: url) else {
            return .failure(.fileLoadingFailed)
        }
        
        do {
            let words = try JSONDecoder().decode([Word2].self, from: data)
            return .success(words)
        } catch let error {
            return.failure(.jsonDecodingFailed)
        }
    }
}
