//
//  ChengYu.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 07/04/23.
//

import Foundation

struct ChineseCharacter: Identifiable {
    let id = UUID()
    var hanzi: String
    var pinyin: String
    var isGuessed: Bool
}

struct ChengYu: Identifiable {
    // array of 4 characters
    var id = UUID()
    var arrayCharacters: [ChineseCharacter]
    var complete: String
    var meaning: String
    
    
    static let example =  ChengYu(
        arrayCharacters: [
            ChineseCharacter(hanzi: "开", pinyin: "kāi", isGuessed: true),
            ChineseCharacter(hanzi: "门", pinyin: "mén", isGuessed: true),
            ChineseCharacter(hanzi: "见", pinyin: "jiàn", isGuessed: false),
            ChineseCharacter(hanzi: "山", pinyin: "shān", isGuessed: false)],
        complete: "开门见山", meaning: "Come straight to the point; without preamble")
}

