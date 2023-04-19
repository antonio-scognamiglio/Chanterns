//
//  ChineseLanternViewModel.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 07/04/23.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var isGameStarted = false
    
    // This will be used to pause all the animations
    @Published var isAnimationPaused = false
    
//    var yStartPosition: CGFloat = 0
//    var YEndPosition: CGFloat = 0
    
    @Published var chineseLanternColumns: ChineseLanternColumns = ChineseLanternColumns()
    @Published var livesLeft = 3
    @Published var leftToBeGuessed: [String] = []
    @Published var hasLost = false
    @Published var hasWon = false
    @Published var showCongratulations = false
 
    // In questo modo funziona perché li sto assegnando ad una classe, e quindi i cambiamenti si riflettono, cioè sto copiando il loro riferimento in memoria
    @Published var levels: [Level] = Level.originalLevels

    
    
    static let lanternImages = ["Lantern01", "Lantern02", "Lantern03"]
    
    
    private func generateLantern (level: LevelNumber) -> ChineseLantern {
        let newLantern = ChineseLantern(lanternImage: GameViewModel.lanternImages.randomElement()!, character: level.levelCharacters().randomElement()!, isAnimationEnd: false, animationTime: Double.random(in: 3.0...6.00), isTapped: false)
        return newLantern
    }
    
    private func generateLanternsChunk(numberOfLanterns: Int, yPosition: CGFloat, level: LevelNumber) -> ChineseLanternsChunk {
        var lanternsArray: [ChineseLantern] = []
        for _ in 1...numberOfLanterns {
            let newLantern = generateLantern(level: level)
            lanternsArray.append(newLantern)
        }
        let lanternsChunk = ChineseLanternsChunk(yPosition: yPosition, chineseLanternsChunk: lanternsArray)
        return lanternsChunk
    }
    
    func generateColumns(lanternsPerColumn: Int, yPosition: CGFloat, level: LevelNumber){
        chineseLanternColumns.columnA = generateLanternsChunk(numberOfLanterns: lanternsPerColumn, yPosition: yPosition, level: level)
        chineseLanternColumns.columnB = generateLanternsChunk(numberOfLanterns: lanternsPerColumn, yPosition: yPosition, level: level)
        chineseLanternColumns.columnC = generateLanternsChunk(numberOfLanterns: lanternsPerColumn, yPosition: yPosition, level: level)
        chineseLanternColumns.columnD = generateLanternsChunk(numberOfLanterns: lanternsPerColumn, yPosition: yPosition, level: level)
    }
    
    // Needs to be changed, everything should be moved to the viewModel
    func checkTap(column: ChineseLanternsChunk, level: Level){
        let index = column.index
        withAnimation {
            if leftToBeGuessed.first == column.chineseLanternsChunk[index].character {
                if let characterIndex: Int = level.chengYu.arrayCharacters.firstIndex(where: { character in
                    character.hanzi == column.chineseLanternsChunk[index].character
                }){
                leftToBeGuessed.removeFirst()
//                    replaceCharacter(hanziToBeReplaced: level.chengYu.arrayCharacters[characterIndex].hanzi)
                level.chengYu.arrayCharacters[characterIndex].isGuessed = true
                    
                    if leftToBeGuessed.isEmpty {
                        // svuotare tutte le colonne
                        withAnimation {
                            showCongratulations = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            self.hasWon = true
                        }
                    }
                        
                    }
                }
            } else if livesLeft >= 1 {
                    withAnimation {
                        livesLeft -= 1
                        if livesLeft == 0 {
                            hasLost = true
                        }
                    }
            }
        }
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
                    if self.chineseLanternColumns.columnA.chineseLanternsChunk.count > index + 1 && !self.chineseLanternColumns.columnA.chineseLanternsChunk[index].isTapped && !self.chineseLanternColumns.columnA.chineseLanternsChunk[index].isAnimationEnd && !self.isAnimationPaused {
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
                        !self.chineseLanternColumns.columnB.chineseLanternsChunk[index].isAnimationEnd && !self.isAnimationPaused {
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
                    if self.chineseLanternColumns.columnC.chineseLanternsChunk.count > index + 1 && !self.chineseLanternColumns.columnC.chineseLanternsChunk[index].isTapped && !self.chineseLanternColumns.columnC.chineseLanternsChunk[index].isAnimationEnd && !self.isAnimationPaused {
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
                        !self.chineseLanternColumns.columnD.chineseLanternsChunk[index].isAnimationEnd && !self.isAnimationPaused  {
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
                && !column.chineseLanternsChunk[column.index].isAnimationEnd && !column.chineseLanternsChunk[column.index].isTapped && isGameStarted {
            return true
        } else {
            return false
        }
    }
    
    func resetColumns() {
        withAnimation {
            chineseLanternColumns.columnA.chineseLanternsChunk = []
            chineseLanternColumns.columnB.chineseLanternsChunk = []
            chineseLanternColumns.columnC.chineseLanternsChunk = []
            chineseLanternColumns.columnD.chineseLanternsChunk = []
        }
        
        // oppure chineseLanternColumns = ChineseLanternColumns()
    }
    
    // sostituisce i caratteri già indovinati del chengyu con il prossimo che resta da indovinare
//    func replaceCharacter(hanziToBeReplaced: String){
//        for chineseLantern in chineseLanternColumns.columnA.chineseLanternsChunk {
//            if chineseLantern.character == hanziToBeReplaced {
//                if leftToBeGuessed.isEmpty {
//                    withAnimation {
//                        chineseLantern.character = leftToBeGuessed.first ?? "好"
//                    }
//                }
//            }
//        }
//        for chineseLantern in chineseLanternColumns.columnB.chineseLanternsChunk {
//            if chineseLantern.character == hanziToBeReplaced {
//                if leftToBeGuessed.isEmpty {
//                    withAnimation {
//                        chineseLantern.character = leftToBeGuessed.first ?? "好"
//                    }
//                }
//            }
//        }
//        for chineseLantern in chineseLanternColumns.columnC.chineseLanternsChunk {
//            if chineseLantern.character == hanziToBeReplaced {
//                if leftToBeGuessed.isEmpty {
//                    withAnimation {
//                        chineseLantern.character = leftToBeGuessed.first ?? "好"
//                    }
//                }
//            }
//        }
//        for chineseLantern in chineseLanternColumns.columnD.chineseLanternsChunk {
//            if chineseLantern.character == hanziToBeReplaced {
//                if leftToBeGuessed.isEmpty {
//                    withAnimation {
//                        chineseLantern.character = leftToBeGuessed.first ?? "好"
//                    }
//                }
//            }
//        }
//    }
    
    
    func resetGame() {
        withAnimation {
            isGameStarted = false
            isAnimationPaused = false
            chineseLanternColumns = ChineseLanternColumns()
            livesLeft = 3
            leftToBeGuessed = []
            hasLost = false
            hasWon = false
            showCongratulations = false
        }
    }
    
    // Questa funzione restituisce il livello corrente allo stato non iniziato
    func tryAgain(level: Level) {
        resetGame()
//        let levelIndex: Int = Level.originalLevels.firstIndex(of: level) ?? 0
        for loop in OriginalLevels.defaultLevels {
            if level.levelNumber == loop.levelNumber {
                print("È LUI, TROVATOOO")
                level.chengYu = loop.chengYu
                level.timeLeft = loop.timeLeft
            } else  {
                print("********** NON HO TROVATO LO STESSO LIVELLO")
            }
        }
//        level.cleanLevel(level: levels[levelIndex])
        // STA FUNZIONANDO MALE QUESTA FUNZIONE
//        level.chengYu = Level.originalLevels[levelIndex].chengYu
//        level.timeLeft = Level.originalLevels[levelIndex].timeLeft
        print("***********DENTRO LA FUNZIONE")
        print(level.timeLeft)
        print(level.chengYu)
    }
    
    func nextLevel(level: Level) -> Level? {
        // Resetto il gioco
        resetGame()
        // prendo l'indice del livello
        let levelIndex: Int = levels.firstIndex(of: level) ?? 0
        // segno il livello come completo
        levels[levelIndex].isCompleted = true
        // Se c'è un altro livello dopo questo, lo sblocco e lo restituisco
        if levels.count - 1 > levelIndex {
            levels[levelIndex + 1].isUnlocked = true
            return levels[levelIndex + 1]
        } else {
            // Altrimenti mando dietro nil
            return nil
        }
        
    }
    
}
    
