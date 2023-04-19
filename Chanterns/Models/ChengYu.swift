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
    
    static let characterList: [String] = ["我","你","老","莫","是","人","吗","包","开","门","见","山","压","力","效","应","全","神","贯","注","朝","三","暮","四","厮","守","终","生","眼","见","为","实","四","海","为","家","顺","其","自","然","火","上","加","油","胡","说","八","道"]
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

