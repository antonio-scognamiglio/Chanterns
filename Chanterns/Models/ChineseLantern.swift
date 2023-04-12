//
//  ChineseLantern.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 07/04/23.
//

import Foundation
import SwiftUI

//struct ChineseLantern: Identifiable, Equatable, Hashable {
//    let id = UUID()
//    var lanternImage: String
//    var character: String
//    var isAnimationEnd: Bool
//    var animationTime: Double
//    var isTapped: Bool
//
//    static let example = ChineseLantern(lanternImage: "ChineseLantern02", character: "我", isAnimationEnd: false, animationTime: 3.0, isTapped: false)
//}

class ChineseLantern: Identifiable, Equatable, ObservableObject {
    static func == (lhs: ChineseLantern, rhs: ChineseLantern) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
    @Published var lanternImage: String
    @Published var character: String
    @Published var isAnimationEnd: Bool
    @Published var animationTime: Double
    @Published var isTapped: Bool
    
    static let example = ChineseLantern(lanternImage: "ChineseLantern02", character: "我", isAnimationEnd: false, animationTime: 3.0, isTapped: false)
    
    init(lanternImage: String, character: String, isAnimationEnd: Bool, animationTime: Double, isTapped: Bool) {
        self.lanternImage = lanternImage
        self.character = character
        self.isAnimationEnd = isAnimationEnd
        self.animationTime = animationTime
        self.isTapped = isTapped
    }
    
}
// A piece of an Array of Chinese Lanterns
struct ChineseLanternsChunk: Identifiable {
    let id = UUID()
    var index = 0
    var yPosition: CGFloat?
    var chineseLanternsChunk: [ChineseLantern] = []
    
}

struct ChineseLanternColumns: Identifiable {
    let id = UUID()
    var columnA: ChineseLanternsChunk = ChineseLanternsChunk()
    var columnB: ChineseLanternsChunk = ChineseLanternsChunk()
    var columnC: ChineseLanternsChunk = ChineseLanternsChunk()
    var columnD: ChineseLanternsChunk = ChineseLanternsChunk()
}


