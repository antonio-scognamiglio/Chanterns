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

struct ChengYu {
    // array of 4 characters
    var arrayCharacters: [ChineseCharacter]
    var meaning: String
}

