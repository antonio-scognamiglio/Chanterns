//
//  Level.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 15/04/23.
//

import Foundation

class Level: Equatable, Identifiable, ObservableObject {
    static func == (lhs: Level, rhs: Level) -> Bool {
        lhs.id == rhs.id
    }
    
    @Published var id = UUID()
    @Published var timeLeft: Int
    @Published var chengYu: ChengYu
    @Published var isUnlocked: Bool
    @Published var isCompleted: Bool
    @Published var levelNumber: LevelNumber
    
    init(timeLeft: Int, chengYu: ChengYu, isUnlocked: Bool, isCompleted: Bool, levelNumber: LevelNumber) {
        self.timeLeft = timeLeft
        self.chengYu = chengYu
        self.isUnlocked = isUnlocked
        self.isCompleted = isCompleted
        self.levelNumber = levelNumber
    }
    
    static let originalLevels: [Level] = [
        Level(
            timeLeft: 10,
            chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "开", pinyin: "kāi", isGuessed: false),
                                               ChineseCharacter(hanzi: "门", pinyin: "mén", isGuessed: false),
                                               ChineseCharacter(hanzi: "见", pinyin: "jiàn", isGuessed: false),
                                               ChineseCharacter(hanzi: "山", pinyin: "shān", isGuessed: false)],
                complete: "开门见山", meaning: "Come straight to the point; without preamble"),
            isUnlocked: true,
            isCompleted: true, levelNumber: .level1),
        Level(timeLeft: 9,
              chengYu:  ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "全", pinyin: "quán", isGuessed: false),
                                                  ChineseCharacter(hanzi: "神", pinyin: "shén", isGuessed: false),
                                                  ChineseCharacter(hanzi: "贯", pinyin: "guàn", isGuessed: false),
                                                  ChineseCharacter(hanzi: "注", pinyin: "zhù", isGuessed: false)],
                                complete: "全神贯注", meaning: "Concentrate one's attention on; be absorbed"),
              isUnlocked: false,
              isCompleted: false, levelNumber: .level2),
        Level(timeLeft: 8,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "朝", pinyin: "zhāo", isGuessed: false),
                                                 ChineseCharacter(hanzi: "三", pinyin: "sān", isGuessed: false),
                                                 ChineseCharacter(hanzi: "暮", pinyin: "mù", isGuessed: false),
                                                 ChineseCharacter(hanzi: "四", pinyin: "sì", isGuessed: false)],
                               complete: "朝三暮四", meaning: "Lit. Say three in the morning but four in the evening (idiom); to change sth that is already settled upon"), isUnlocked: false, isCompleted: false, levelNumber: .level3),
        Level(timeLeft: 7,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "厮", pinyin: "sī", isGuessed: false),
                                                 ChineseCharacter(hanzi: "守", pinyin: "shǒu", isGuessed: false),
                                                 ChineseCharacter(hanzi: "终", pinyin: "zhōng", isGuessed: false),
                                                 ChineseCharacter(hanzi: "生", pinyin: "shēng", isGuessed: false)],
                               complete: "厮守终生", meaning: "Stay together all one's life"), isUnlocked: false, isCompleted: false, levelNumber: .level4),
        Level(timeLeft: 6,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "眼", pinyin: "yǎn", isGuessed: false),
                                                 ChineseCharacter(hanzi: "见", pinyin: "jiàn", isGuessed: false),
                                                 ChineseCharacter(hanzi: "为", pinyin: "wéi", isGuessed: false),
                                                 ChineseCharacter(hanzi: "实", pinyin: "shí", isGuessed: false)],
                               complete: "眼见为实", meaning: "Seeing is believing"), isUnlocked: false, isCompleted: false, levelNumber: .level5),
        Level(timeLeft: 5,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "四", pinyin: "sì", isGuessed: false),
                                                               ChineseCharacter(hanzi: "海", pinyin: "hǎi", isGuessed: false),
                                                               ChineseCharacter(hanzi: "为", pinyin: "wéi", isGuessed: false),
                                                               ChineseCharacter(hanzi: "家", pinyin: "jiā", isGuessed: false)],
                               complete: "四海为家", meaning: "To feel at home anywhere"), isUnlocked: false, isCompleted: false, levelNumber: .level6),
        Level(timeLeft: 4,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "顺", pinyin: "shùn", isGuessed: false),
                                                 ChineseCharacter(hanzi: "其", pinyin: "qí", isGuessed: false),
                                                 ChineseCharacter(hanzi: "自", pinyin: "zì", isGuessed: false),
                                                 ChineseCharacter(hanzi: "然", pinyin: "rán", isGuessed: false)],
                               complete: "顺其自然", meaning: "Let it be"), isUnlocked: false, isCompleted: false, levelNumber: .level7),
        Level(timeLeft: 3,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "火", pinyin: "huǒ", isGuessed: false),
                                                                    ChineseCharacter(hanzi: "上", pinyin: "shàng", isGuessed: false),
                                                                    ChineseCharacter(hanzi: "加", pinyin: "jiā", isGuessed: false),
                                                                    ChineseCharacter(hanzi: "油", pinyin: "yóu", isGuessed: false)],
                               complete: "火上加油", meaning: "To aggravate a situation"), isUnlocked: false, isCompleted: false, levelNumber: .level8),
        Level(timeLeft: 2, chengYu:  ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "胡", pinyin: "hú", isGuessed: false),
                                                               ChineseCharacter(hanzi: "说", pinyin: "shuō", isGuessed: false),
                                                               ChineseCharacter(hanzi: "八", pinyin: " bā", isGuessed: false),
                                                               ChineseCharacter(hanzi: "道", pinyin: "dào", isGuessed: false)],
                                             complete: "胡说八道", meaning: "Talk nonsense"), isUnlocked: false, isCompleted: false, levelNumber: .level9)

        ]
    
    func cleanLevel(level: Level){

        self.chengYu = level.chengYu
        self.timeLeft = level.timeLeft
    }

}

// These are for resetting
struct OriginalLevels {
    
    static let defaultLevels = [
        Level(
            timeLeft: 10,
            chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "开", pinyin: "kāi", isGuessed: false),
                                               ChineseCharacter(hanzi: "门", pinyin: "mén", isGuessed: false),
                                               ChineseCharacter(hanzi: "见", pinyin: "jiàn", isGuessed: false),
                                               ChineseCharacter(hanzi: "山", pinyin: "shān", isGuessed: false)],
                complete: "开门见山", meaning: "Come straight to the point; without preamble"),
            isUnlocked: true,
            isCompleted: true, levelNumber: .level1),
        Level(timeLeft: 9,
              chengYu:  ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "全", pinyin: "quán", isGuessed: false),
                                                  ChineseCharacter(hanzi: "神", pinyin: "shén", isGuessed: false),
                                                  ChineseCharacter(hanzi: "贯", pinyin: "guàn", isGuessed: false),
                                                  ChineseCharacter(hanzi: "注", pinyin: "zhù", isGuessed: false)],
                                complete: "全神贯注", meaning: "Concentrate one's attention on; be absorbed"),
              isUnlocked: false,
              isCompleted: false, levelNumber: .level2),
        Level(timeLeft: 8,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "朝", pinyin: "zhāo", isGuessed: false),
                                                 ChineseCharacter(hanzi: "三", pinyin: "sān", isGuessed: false),
                                                 ChineseCharacter(hanzi: "暮", pinyin: "mù", isGuessed: false),
                                                 ChineseCharacter(hanzi: "四", pinyin: "sì", isGuessed: false)],
                               complete: "朝三暮四", meaning: "Lit. Say three in the morning but four in the evening (idiom); to change sth that is already settled upon"), isUnlocked: false, isCompleted: false, levelNumber: .level3),
        Level(timeLeft: 7,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "厮", pinyin: "sī", isGuessed: false),
                                                 ChineseCharacter(hanzi: "守", pinyin: "shǒu", isGuessed: false),
                                                 ChineseCharacter(hanzi: "终", pinyin: "zhōng", isGuessed: false),
                                                 ChineseCharacter(hanzi: "生", pinyin: "shēng", isGuessed: false)],
                               complete: "厮守终生", meaning: "Stay together all one's life"), isUnlocked: false, isCompleted: false, levelNumber: .level4),
        Level(timeLeft: 6,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "眼", pinyin: "yǎn", isGuessed: false),
                                                 ChineseCharacter(hanzi: "见", pinyin: "jiàn", isGuessed: false),
                                                 ChineseCharacter(hanzi: "为", pinyin: "wéi", isGuessed: false),
                                                 ChineseCharacter(hanzi: "实", pinyin: "shí", isGuessed: false)],
                               complete: "眼见为实", meaning: "Seeing is believing"), isUnlocked: false, isCompleted: false, levelNumber: .level5),
        Level(timeLeft: 5,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "四", pinyin: "sì", isGuessed: false),
                                                               ChineseCharacter(hanzi: "海", pinyin: "hǎi", isGuessed: false),
                                                               ChineseCharacter(hanzi: "为", pinyin: "wéi", isGuessed: false),
                                                               ChineseCharacter(hanzi: "家", pinyin: "jiā", isGuessed: false)],
                               complete: "四海为家", meaning: "To feel at home anywhere"), isUnlocked: false, isCompleted: false, levelNumber: .level6),
        Level(timeLeft: 4,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "顺", pinyin: "shùn", isGuessed: false),
                                                 ChineseCharacter(hanzi: "其", pinyin: "qí", isGuessed: false),
                                                 ChineseCharacter(hanzi: "自", pinyin: "zì", isGuessed: false),
                                                 ChineseCharacter(hanzi: "然", pinyin: "rán", isGuessed: false)],
                               complete: "顺其自然", meaning: "Let it be"), isUnlocked: false, isCompleted: false, levelNumber: .level7),
        Level(timeLeft: 3,
              chengYu: ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "火", pinyin: "huǒ", isGuessed: false),
                                                                    ChineseCharacter(hanzi: "上", pinyin: "shàng", isGuessed: false),
                                                                    ChineseCharacter(hanzi: "加", pinyin: "jiā", isGuessed: false),
                                                                    ChineseCharacter(hanzi: "油", pinyin: "yóu", isGuessed: false)],
                               complete: "火上加油", meaning: "To aggravate a situation"), isUnlocked: false, isCompleted: false, levelNumber: .level8),
        Level(timeLeft: 2, chengYu:  ChengYu(arrayCharacters: [ChineseCharacter(hanzi: "胡", pinyin: "hú", isGuessed: false),
                                                               ChineseCharacter(hanzi: "说", pinyin: "shuō", isGuessed: false),
                                                               ChineseCharacter(hanzi: "八", pinyin: " bā", isGuessed: false),
                                                               ChineseCharacter(hanzi: "道", pinyin: "dào", isGuessed: false)],
                                             complete: "胡说八道", meaning: "Talk nonsense"), isUnlocked: false, isCompleted: false, levelNumber: .level9)
        
        ]
}

enum LevelNumber: String {
    case level1 = "1"
    case level2 = "2"
    case level3 = "3"
    case level4 = "4"
    case level5 = "5"
    case level6 = "6"
    case level7 = "7"
    case level8 = "8"
    case level9 = "9"
    
    func generateAnimationTime() -> Double {
        switch self {
        case .level1:
           return Double.random(in: 4.0...7.00)
        case .level2:
           return Double.random(in: 3.8...6.8)
        case .level3:
            return Double.random(in: 3.6...6.6)
        case .level4:
            return Double.random(in: 3.4...6.4)
        case .level5:
            return Double.random(in: 3.2...6.2)
        case .level6:
            return Double.random(in: 3.0...6.0)
        case .level7:
            return Double.random(in: 3.0...5.8)
        case .level8:
            return Double.random(in: 3.0...5.4)
        case .level9:
            return Double.random(in: 3.0...5.2)
        }
    }
    
    func levelCharacters() -> [String] {
        var levelCharacters: [String] = []
        switch self {
        case .level1:
            for level in Level.originalLevels {
                if level.levelNumber == .level1 {
                    for character in level.chengYu.arrayCharacters {
                        for _ in 1...5 {
                            levelCharacters.append(character.hanzi)
                        }
                    }
                    levelCharacters += ChineseCharacter.characterList + Array(repeating: level.chengYu.arrayCharacters.first!.hanzi, count: 10)
                }
            }
            return levelCharacters.shuffled()
        
        case .level2:
            for level in Level.originalLevels {
                if level.levelNumber == .level2 {
                    for character in level.chengYu.arrayCharacters {
                        for _ in 1...5 {
                            levelCharacters.append(character.hanzi)
                        }
                    }
                    levelCharacters += ChineseCharacter.characterList + Array(repeating: level.chengYu.arrayCharacters.first!.hanzi, count: 10)
                }
            }
            return levelCharacters.shuffled()
            
        case .level3:
            for level in Level.originalLevels {
                if level.levelNumber == .level3 {
                    for character in level.chengYu.arrayCharacters {
                        for _ in 1...5 {
                            levelCharacters.append(character.hanzi)
                        }
                    }
                    levelCharacters += ChineseCharacter.characterList + Array(repeating: level.chengYu.arrayCharacters.first!.hanzi, count: 10)
                }
            }
            return levelCharacters.shuffled()
            
        case .level4:
            for level in Level.originalLevels {
                if level.levelNumber == .level4 {
                    for character in level.chengYu.arrayCharacters {
                        for _ in 1...5 {
                            levelCharacters.append(character.hanzi)
                        }
                    }
                    levelCharacters += ChineseCharacter.characterList + Array(repeating: level.chengYu.arrayCharacters.first!.hanzi, count: 10)
                }
            }
            return levelCharacters.shuffled()
        case .level5:
            for level in Level.originalLevels {
                if level.levelNumber == .level5 {
                    for character in level.chengYu.arrayCharacters {
                        for _ in 1...5 {
                            levelCharacters.append(character.hanzi)
                        }
                    }
                    levelCharacters += ChineseCharacter.characterList + Array(repeating: level.chengYu.arrayCharacters.first!.hanzi, count: 10)
                }
            }
            return levelCharacters.shuffled()
        case .level6:
            for level in Level.originalLevels {
                if level.levelNumber == .level6 {
                    for character in level.chengYu.arrayCharacters {
                        for _ in 1...5 {
                            levelCharacters.append(character.hanzi)
                        }
                    }
                    levelCharacters += ChineseCharacter.characterList + Array(repeating: level.chengYu.arrayCharacters.first!.hanzi, count: 10)
                }
            }
            
            return levelCharacters.shuffled()
            
        case .level7:
            for level in Level.originalLevels {
                if level.levelNumber == .level7 {
                    for character in level.chengYu.arrayCharacters {
                        for _ in 1...5 {
                            levelCharacters.append(character.hanzi)
                        }
                    }
                    levelCharacters += ChineseCharacter.characterList + Array(repeating: level.chengYu.arrayCharacters.first!.hanzi, count: 10)
                }
            }
            return levelCharacters.shuffled()
            
        case .level8:
            for level in Level.originalLevels {
                if level.levelNumber == .level8 {
                    for character in level.chengYu.arrayCharacters {
                        for _ in 1...5 {
                            levelCharacters.append(character.hanzi)
                        }
                    }
                    levelCharacters += ChineseCharacter.characterList + Array(repeating: level.chengYu.arrayCharacters.first!.hanzi, count: 10)
                }
            }
            return levelCharacters.shuffled()
            
        case .level9:
            for level in Level.originalLevels {
                if level.levelNumber == .level9 {
                    for character in level.chengYu.arrayCharacters {
                        for _ in 1...5 {
                            levelCharacters.append(character.hanzi)
                        }
                    }
                    levelCharacters += ChineseCharacter.characterList + Array(repeating: level.chengYu.arrayCharacters.first!.hanzi, count: 10)
                }
            }
            return levelCharacters.shuffled()
        }
    }
}
