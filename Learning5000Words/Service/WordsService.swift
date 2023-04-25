//
//  WordsService.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 21.04.2023.
//

import Foundation

class WordsService {
    
    var words = [WordModel]()

    var jsonLoader = JsonLoader()
    
    func next() -> Word {
        
        let word = words.removeFirst()
        
        var variants = [String]()
        
        for _ in 1...3 {
            let random = Int.random(in: 0..<words.count)
            let translate = words[random].translate
            variants += [translate]
        }
        
        variants.append(word.translate)
        variants.shuffle()
        
        let result = Word.init(word: word.word, translate: word.translate, variants: variants)
        
        return result
    }
    
    func loadWords() {
        let result = jsonLoader.loadWords2(fileName: "words5000")
        
        switch result {
        case .success(let words):
            self.words = words
        case .failure(let error):
            print(error)
        }
    }
    
  
    
}
