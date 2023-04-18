//
//  WordsSettings.swift
//  Learning5000Words
//
//  Created by Pavel Lazarev Macbook on 31.03.2023.
//

import Foundation

class WordService {
    
    var words: [Word] = []
    
    private let studiedWords: [Word] = [
        Word(name: "arouse", description: "An ability to influence the audience and to arouse the masses", transcription: "[əˈraʊz]", translation: "пробуждать"),
        Word(name: "pretty", description: "He looked pretty fit for his age", transcription: "[ˈprɪti]", translation: "симпатичный, хорошенький"),
        Word(name: "grand", description: "The dinner party was very grand", transcription: "[ɡrænd]", translation: "великий, большой"),
        Word(name: "volume", description: "The sewer could not cope with the volume of rainwat", transcription: "[ˈvɑːljuːm]", translation: "объем, громкость"),
        Word(name: "coach", description: "The coach congratulated the team on their victory", transcription: "[koʊtʃ]", translation: "тренер"),
        Word(name: "provide", description: "I will provide you with the necessary documents", transcription: "[prəˈvaɪd]", translation: "предоставлять, обеспечивать"),
        Word(name: "condition", description: "The car is rather old but still in good condition", transcription: "[kənˈdɪʃn]", translation: "состояние, условие"),
        Word(name: "land", description: "The seaman was very happy when he saw the land", transcription: "[lænd]", translation: "земля"),
        Word(name: "scope", description: "Such innovations are beyond the scope of our budget", transcription: "[skoʊp]", translation: "объем"),
        Word(name: "pack", description: "I left my pack of cookies on the table", transcription: "[pæk]", translation: "пакет, пачка"),
        Word(name: "craft", description: "I want to learn a craft like mosaics or carving", transcription: "[kræft]", translation: "ремесло"),
        Word(name: "worth", description: "The expert gave a preliminary estimate of the worth of the company", transcription: "[wɜːrθ]", translation: "ценность, достоинства"),
    ]
    
    func fetchWords() {
        words = studiedWords
    }
}
