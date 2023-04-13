//
//  ContentView.swift
//  Chanterns
//
//  Created by Antonio Scognamiglio on 06/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var gameViewModel = GameViewModel()
    var arrayCharacters = ["你","好","老","神"]
    var columnAIndex: Int {
        gameViewModel.chineseLanternColumns.columnA.index
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("NightSkyDark")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                if !gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk.isEmpty && !gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[gameViewModel.chineseLanternColumns.columnA.index].isAnimationEnd {
                    
                    ChineseLanternView(chineseLantern: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex]
                    )
                    
                        .position(x: geo.frame(in: .global).minX + 120, y: gameViewModel.chineseLanternColumns.columnA.yPosition!)
                        .animation(.easeIn(duration: gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].animationTime), value: gameViewModel.chineseLanternColumns.columnA.yPosition)
                        .id(gameViewModel.chineseLanternColumns.columnA.index )
                    // change lantern after destination reached
                        .onChange(of: gameViewModel.chineseLanternColumns.columnA.yPosition, perform: {_ in
                            let time = gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[columnAIndex].animationTime
                            let index = gameViewModel.chineseLanternColumns.columnA.index
                            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {
                                withAnimation {
                                    if gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk.count  - 1 > columnAIndex && !gameViewModel.chineseLanternColumns.columnA.chineseLanternsChunk[index].isTapped {
                                        gameViewModel.chineseLanternColumns.columnA.index += 1
                                        gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).maxY + 100
                                    }
                                }
                            })
                        })
// change the index on tap gesture and reset position
                        .onTapGesture {
                            gameViewModel.nextLanterAfterTappingColumn(column: &gameViewModel.chineseLanternColumns.columnA, geo: geo)                       }
                }
            }
            // Start the game
            .onAppear {
                gameViewModel.generateColumns(lanternsPerColumn: 20, yPosition: geo.frame(in: .global).maxY)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY - 200
                }
        }
            // Reset Position after index has changed
            .onChange(of: gameViewModel.chineseLanternColumns.columnA.index) { newValue in
                gameViewModel.chineseLanternColumns.columnA.yPosition = geo.frame(in: .global).minY - 200
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
