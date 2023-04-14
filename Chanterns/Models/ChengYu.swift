//
//  ChengYu.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 07/04/23.
//

import Foundation

struct ChineseCharacter {
    var hanzi: String
    var pinyin: String
    var isGuessed: Bool
}

struct ChengYu: Identifiable {
    // array of 4 characters
    var id = UUID()
    var arrayCharacters: [ChineseCharacter]
    var meaning: String
    
    static let example =  ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "开", pinyin: "kāi", isGuessed: false),
                                                    ChineseCharacter(hanzi: "门", pinyin: "mén", isGuessed: false),
                                                    ChineseCharacter(hanzi: "见", pinyin: "jiàn", isGuessed: false),
                                                    ChineseCharacter(hanzi: "山", pinyin: "shān", isGuessed: false)],
                                   meaning: "Come straight to the point; without preamble")
}

