//
//  JsonLoader.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 19.04.2023.
//

import Foundation

final class JsonLoader {
    enum jsonError: Error {
        case fileNotFound
        case fileLoadingFailed
        case jsonDecodingFailed
    }

//
//    func loadWords(fileName: String) ->[WordModel]? {
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let jsonData = try JSONDecoder().decode([WordModel].self, from: data)
//                return jsonData
//            } catch {
//                print("error: \(error)")
//            }
//        }
//        return nil
//    }
    
     func loadWords2(fileName: String) -> Result <[WordModel], jsonError> {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return .failure(.fileNotFound)
        }
        guard let data = try? Data(contentsOf: url) else {
            return .failure(.fileLoadingFailed)
        }

        do {
            let words = try JSONDecoder().decode([WordModel].self, from: data)
            return .success(words)
        } catch {
            print(error)
            return.failure(.jsonDecodingFailed)
        }
    }
}
