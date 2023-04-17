//
//  Level.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 15/04/23.
//

import Foundation

struct Level: Equatable {
    static func == (lhs: Level, rhs: Level) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
    var timeLeft: Int
    var chengYu: ChengYu
    var isUnlocked: Bool
    var isCompleted: Bool
    var levelNumber: LevelNumber
}

enum LevelNumber {
    case level1
    case level2
    case level3
    case level4
    case level5
    case level6
    case level7
    case level8
    case level9
    
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
}
