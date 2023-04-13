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
    
    func nextLanterAfterMovingColumnA(geo: GeometryProxy) {
        let index = chineseLanternColumns.columnA.index
        let time = chineseLanternColumns.columnA.chineseLanternsChunk[index].animationTime
        DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
            withAnimation {
                if self.chineseLanternColumns.columnA.chineseLanternsChunk.count  - 1 > index && !self.chineseLanternColumns.columnA.chineseLanternsChunk[index].isTapped {
                    self.chineseLanternColumns.columnA.index += 1
                    self.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).maxY + 100
                }
            }
        })
    }
}
    
