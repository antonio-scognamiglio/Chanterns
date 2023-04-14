//
//  ChineseLanternViewModel.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 07/04/23.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var chineseLanternColumns: ChineseLanternColumns = ChineseLanternColumns()
    
    @Published var chengYus = [
        // Level 1
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "开", pinyin: "kāi", isGuessed: false),
                                 ChineseCharacter(hanzi: "门", pinyin: "mén", isGuessed: false),
                                 ChineseCharacter(hanzi: "见", pinyin: "jiàn", isGuessed: false),
                                 ChineseCharacter(hanzi: "山", pinyin: "shān", isGuessed: false)],
                meaning: "Come straight to the point; without preamble"),
        // Level 2
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "压", pinyin: "yā", isGuessed: false),
                                 ChineseCharacter(hanzi: "力", pinyin: "lì", isGuessed: false),
                                 ChineseCharacter(hanzi: "效", pinyin: "xiào", isGuessed: false),
                                 ChineseCharacter(hanzi: "应", pinyin: "yìng", isGuessed: false)],
                meaning: "LOOK FOR THE MEANING"),
        // Level 3
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "全", pinyin: "quán", isGuessed: false),
                                 ChineseCharacter(hanzi: "神", pinyin: "shén", isGuessed: false),
                                 ChineseCharacter(hanzi: "贯", pinyin: "guàn", isGuessed: false),
                                 ChineseCharacter(hanzi: "注", pinyin: "zhù", isGuessed: false)],
                meaning: "Concentrate one's attention on; be absorbed"),
        // Level 4
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "朝", pinyin: "zhāo", isGuessed: false),
                                 ChineseCharacter(hanzi: "三", pinyin: "sān", isGuessed: false),
                                 ChineseCharacter(hanzi: "暮", pinyin: "mù", isGuessed: false),
                                 ChineseCharacter(hanzi: "四", pinyin: "sì", isGuessed: false)],
                meaning: "Lit. Say three in the morning but four in the evening (idiom); to change sth that is already settled upon"),
        // Level 5
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "厮", pinyin: "sī", isGuessed: false),
                                 ChineseCharacter(hanzi: "守", pinyin: "shǒu", isGuessed: false),
                                 ChineseCharacter(hanzi: "终", pinyin: "zhōng", isGuessed: false),
                                 ChineseCharacter(hanzi: "生", pinyin: "shēng", isGuessed: false)],
                meaning: "Stay together all one's life"),
        // Level 6
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "眼", pinyin: "yǎn", isGuessed: false),
                                 ChineseCharacter(hanzi: "见", pinyin: "jiàn", isGuessed: false),
                                 ChineseCharacter(hanzi: "为", pinyin: "wéi", isGuessed: false),
                                 ChineseCharacter(hanzi: "实", pinyin: "shí", isGuessed: false)],
                meaning: "Seeing is believing"),
        // Level 7
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "四", pinyin: "sì", isGuessed: false),
                                 ChineseCharacter(hanzi: "海", pinyin: "hǎi", isGuessed: false),
                                 ChineseCharacter(hanzi: "为", pinyin: "wéi", isGuessed: false),
                                 ChineseCharacter(hanzi: "家", pinyin: "jiā", isGuessed: false)],
                meaning: "To feel at home anywhere"),
        // Level 8
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "顺", pinyin: "shùn", isGuessed: false),
                                 ChineseCharacter(hanzi: "其", pinyin: "qí", isGuessed: false),
                                 ChineseCharacter(hanzi: "自", pinyin: "zì", isGuessed: false),
                                 ChineseCharacter(hanzi: "然", pinyin: "rán", isGuessed: false)],
                meaning: "Let it be"),
        // Level 9
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "火", pinyin: "huǒ", isGuessed: false),
                                 ChineseCharacter(hanzi: "上", pinyin: "shàng", isGuessed: false),
                                 ChineseCharacter(hanzi: "加", pinyin: "jiā", isGuessed: false),
                                 ChineseCharacter(hanzi: "油", pinyin: "yóu", isGuessed: false)],
                meaning: "To aggravate a situation"),
        // Level 10
        ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "胡", pinyin: "hú", isGuessed: false),
                                 ChineseCharacter(hanzi: "说", pinyin: "shuō", isGuessed: false),
                                 ChineseCharacter(hanzi: "八", pinyin: " bā", isGuessed: false),
                                 ChineseCharacter(hanzi: "道", pinyin: "dào", isGuessed: false)],
                meaning: "Talk nonsense"),
    ]
    
    static let charactersList = ["我", "你", "老", "莫", "是", "人", "吗", "包"]
    static let lanternImages = ["ChineseLantern01", "ChineseLantern02"]
    
    private func generateLantern () -> ChineseLantern {
        let newLantern = ChineseLantern(lanternImage: GameViewModel.lanternImages.randomElement()!, character: GameViewModel.charactersList.randomElement()!, isAnimationEnd: false, animationTime: Double.random(in: 2.0...5.00), isTapped: false)
        return newLantern
    }
    
    private func generateLanternsChunk(numberOfLanterns: Int, yPosition: CGFloat) -> ChineseLanternsChunk {
        var lanternsArray: [ChineseLantern] = []
        for _ in 1...numberOfLanterns {
            let newLantern = generateLantern()
            lanternsArray.append(newLantern)
        }
        let lanternsChunk = ChineseLanternsChunk(yPosition: yPosition, chineseLanternsChunk: lanternsArray)
        return lanternsChunk
    }
    
    func generateColumns(lanternsPerColumn: Int, yPosition: CGFloat){
        chineseLanternColumns.columnA = generateLanternsChunk(numberOfLanterns: lanternsPerColumn, yPosition: yPosition)
        chineseLanternColumns.columnB = generateLanternsChunk(numberOfLanterns: lanternsPerColumn, yPosition: yPosition)
        chineseLanternColumns.columnC = generateLanternsChunk(numberOfLanterns: lanternsPerColumn, yPosition: yPosition)
        chineseLanternColumns.columnD = generateLanternsChunk(numberOfLanterns: lanternsPerColumn, yPosition: yPosition)
    }
    
    func nextLanterAfterTappingColumn(column: inout ChineseLanternsChunk, geo: GeometryProxy) {
        let index = column.index
        withAnimation {
            column.chineseLanternsChunk[index].isTapped = true
            if column.chineseLanternsChunk.count  - 1 > column.index {
                column.index += 1
                column.yPosition = geo.frame(in: .global).maxY + 100
            }
        }
    }
        
    func nextLanterAfterMovingColumn(column: CurrentColumn, geo: GeometryProxy) {
        switch column {
        case .columnA:
            let index = chineseLanternColumns.columnA.index
            let time = chineseLanternColumns.columnA.chineseLanternsChunk[index].animationTime
            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
                withAnimation {
                    if self.chineseLanternColumns.columnA.chineseLanternsChunk.count > index + 1 && !self.chineseLanternColumns.columnA.chineseLanternsChunk[index].isTapped && !self.chineseLanternColumns.columnA.chineseLanternsChunk[index].isAnimationEnd {
                        self.chineseLanternColumns.columnA.chineseLanternsChunk[index].isTapped = true
                        self.chineseLanternColumns.columnA.index += 1
                        self.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).maxY + 100
                    }
                }
            })
        case .columnB:
            let index = chineseLanternColumns.columnB.index
            let time = chineseLanternColumns.columnB.chineseLanternsChunk[index].animationTime
            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
                withAnimation {
                    if self.chineseLanternColumns.columnB.chineseLanternsChunk.count > index + 1 && !self.chineseLanternColumns.columnB.chineseLanternsChunk[index].isTapped &&
                        !self.chineseLanternColumns.columnB.chineseLanternsChunk[index].isAnimationEnd {
                        self.chineseLanternColumns.columnB.chineseLanternsChunk[index].isTapped = true
                        self.chineseLanternColumns.columnB.index += 1
                        self.chineseLanternColumns.columnB.yPosition = geo.frame(in: .global).maxY + 100
                    }
                }
            })
        case .columnC:
            let index = chineseLanternColumns.columnC.index
            let time = chineseLanternColumns.columnC.chineseLanternsChunk[index].animationTime
            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
                withAnimation {
                    if self.chineseLanternColumns.columnC.chineseLanternsChunk.count > index + 1 && !self.chineseLanternColumns.columnC.chineseLanternsChunk[index].isTapped && !self.chineseLanternColumns.columnC.chineseLanternsChunk[index].isAnimationEnd {
                        self.chineseLanternColumns.columnC.chineseLanternsChunk[index].isTapped = true
                        self.chineseLanternColumns.columnC.index += 1
                        self.chineseLanternColumns.columnC.yPosition = geo.frame(in: .global).maxY + 100
                    }
                }
            })
        case .columnD:
            let index = chineseLanternColumns.columnD.index
            let time = chineseLanternColumns.columnD.chineseLanternsChunk[index].animationTime
            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
                withAnimation {
                    if self.chineseLanternColumns.columnD.chineseLanternsChunk.count > index + 1 && !self.chineseLanternColumns.columnD.chineseLanternsChunk[index].isTapped &&
                        !self.chineseLanternColumns.columnD.chineseLanternsChunk[index].isAnimationEnd {
                        self.chineseLanternColumns.columnD.chineseLanternsChunk[index].isTapped = true
                        self.chineseLanternColumns.columnD.index += 1
                        self.chineseLanternColumns.columnD.yPosition = geo.frame(in: .global).maxY + 100
                    }
                }
            })

        }
    
    }
    
    // Devo stare attento a quando chiamare questa funzione altrimenti la chiamo in loop
    func canCreateLantern(column: ChineseLanternsChunk) -> Bool {
        if
            !column.chineseLanternsChunk.isEmpty 
                && !column.chineseLanternsChunk[column.index].isAnimationEnd && !column.chineseLanternsChunk[column.index].isTapped {
            return true
        } else {
            return false
        }
    }
    
}
    
